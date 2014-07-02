//
//  Level6Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level6Scene.h"
#import "Level7Scene.h"

static CGFloat const kMaxLockDistance = 24;
static CGFloat const kNumObjects = 4;
static NSString *const kBorderName = @"kBorderName";

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@interface Level6Scene()

@property (nonatomic, weak) SKSpriteNode *selectedNode;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSInteger numObjectsLocked;
@property (nonatomic, strong) UITouch *currentTouch;

@end

@implementation Level6Scene

-(void)didMoveToView:(SKView *)view
{
    _currentTouch = nil;
    _numObjectsLocked = 0;
    _gameOver = NO;
    
    // Hide all hidden targets
    [self enumerateChildNodesWithName:@"square-target-hidden" usingBlock:^(SKNode *node, BOOL *stop) {
        node.hidden = YES;
    }];
    
    CGRect frame = self.frame;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(frame.origin.x - 150, frame.origin.y - 150, frame.size.width + 300, frame.size.height + 300)];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.selectedNode == nil && _gameOver == NO)
    {
        UITouch *touch = [touches anyObject];
        self.currentTouch = touch;
        CGPoint positionInScene = [touch locationInNode:self];
        [self _selectNodeForTouch:positionInScene];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touches enumerateObjectsUsingBlock:^(UITouch *touch, BOOL *stop) {
        if ([touch isEqual:self.currentTouch])
        {
            CGPoint positionInScene = [touch locationInNode:self];
            CGPoint previousPosition = [touch previousLocationInNode:self];
            
            CGPoint translation = CGPointMake(positionInScene.x - previousPosition.x, positionInScene.y - previousPosition.y);
            
            [self _panForTranslation:translation];
        }
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touches enumerateObjectsUsingBlock:^(UITouch *touch, BOOL *stop) {
        if ([touch isEqual:self.currentTouch])
        {
            [self _deselectNodeForTouch];
        }
    }];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touches enumerateObjectsUsingBlock:^(UITouch *touch, BOOL *stop) {
        if ([touch isEqual:self.currentTouch])
        {
            [self _deselectNodeForTouch];
        }
    }];
}

- (void)_selectNodeForTouch:(CGPoint)touchLocation
{
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    if ([touchedNode isKindOfClass:[SKSpriteNode class]] && touchedNode.physicsBody && touchedNode.physicsBody.pinned == NO)
    {
        if ([touchedNode.name isEqualToString:kBorderName])
        {
            touchedNode = (SKSpriteNode*)touchedNode.parent;
        }
        self.selectedNode = touchedNode;
        
        // Add border
        NSUInteger borderWidth = 36;
        SKSpriteNode *border = [SKSpriteNode spriteNodeWithColor:[touchedNode.color colorWithAlphaComponent:0.5] size:CGSizeMake(touchedNode.size.width + borderWidth, touchedNode.size.height + borderWidth)];
        border.userInteractionEnabled = NO;
        border.physicsBody.pinned = YES;
        border.name = kBorderName;
        border.position = CGPointZero;
        border.zPosition = -10;
        [touchedNode addChild:border];
    }
}

- (void)_panForTranslation:(CGPoint)translation
{
    if (self.selectedNode)
    {
        CGPoint position = self.selectedNode.position;
        [_selectedNode setPosition:CGPointMake(position.x + translation.x, position.y + translation.y)];
    }
}

- (void)_deselectNodeForTouch
{
    self.currentTouch = nil;
    
    if (self.selectedNode == nil)
    {
        return;
    }
    
    if ([self _checkForObjectLock:self.selectedNode] == NO)
    {
        // Remove border
        [self.selectedNode removeAllChildren];
    }
    
    self.selectedNode = nil;
    
    if ([self _isGameOver])
    {
        _gameOver = YES;
        [self _segueToNextScene];
    }
}

- (BOOL)_checkForObjectLock:(SKSpriteNode *)object
{
    __block BOOL returnVal = NO;
    [self enumerateChildNodesWithName:@"square-target" usingBlock:^(SKNode *node, BOOL *stop) {
        if ([object.color isEqual:[(SKSpriteNode *)node color]])
        {
            // Check if renderingNode is close enough to lock into place
            CGFloat xDistance = fabsf(node.position.x - object.position.x);
            CGFloat yDistance = fabsf(node.position.y - object.position.y);
            
            if (xDistance <= kMaxLockDistance && yDistance <= kMaxLockDistance)
            {
                [self _lockObject:object withTarget:node];
                
                returnVal = YES;
                *stop = YES;
            }
        }
    }];
    
    [self enumerateChildNodesWithName:@"square-target-hidden" usingBlock:^(SKNode *node, BOOL *stop) {
        if ([object.color isEqual:[(SKSpriteNode *)node color]])
        {
            // Check if renderingNode is close enough to lock into place
            CGFloat xDistance = fabsf(node.position.x - object.position.x);
            CGFloat yDistance = fabsf(node.position.y - object.position.y);
            
            if (xDistance <= kMaxLockDistance && yDistance <= kMaxLockDistance)
            {
                [self _lockObject:object withTarget:node];
                
                returnVal = YES;
                *stop = YES;
            }
        }
    }];
    return returnVal;
}

- (void)_lockObject:(SKSpriteNode *)object withTarget:(SKNode *)target
{
    self.numObjectsLocked++;
    
    // Snap into place
    object.position = target.position;
    
    // Disable user interaction
    object.userInteractionEnabled = NO;
    object.physicsBody.pinned = YES;
    
    // Shrink border animation
    SKSpriteNode *border = (SKSpriteNode *)[object childNodeWithName:kBorderName];
    SKAction *shrinkBorderAction = [SKAction scaleTo:0.95 duration:0.4];
    [border runAction:shrinkBorderAction];
    
    // Lock animation
    SKAction *animation = [SKAction sequence:@[[SKAction scaleTo:1.2 duration:0.2], [SKAction scaleTo:1 duration:0.2]]];
    [object runAction:animation];
}

- (BOOL)_isGameOver
{
    return self.numObjectsLocked == kNumObjects;
}

#pragma mark - Helper methods
- (void)_segueToNextScene
{
    SKScene *scene = [Level7Scene unarchiveFromFile:@"Level7Scene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view presentScene:scene transition:[SKTransition fadeWithColor:[UIColor colorWithRed:13/255.0 green:13/255.0 blue:13/255.0 alpha:1] duration:1]];
    });
}

@end
