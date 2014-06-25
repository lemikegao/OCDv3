//
//  Level3Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level3Scene.h"
#import "Level4Scene.h"

static CGFloat const kMaxLockDistance = 24;
static CGFloat const kSolutionNonPinned = 0;
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

@interface Level3Scene()

@property (nonatomic, weak) SKSpriteNode *selectedNode;
@property (nonatomic) BOOL gameOver;

@end

@implementation Level3Scene

-(void)didMoveToView:(SKView *)view
{
    _gameOver = NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_gameOver == NO)
    {
        UITouch *touch = [touches anyObject];
        CGPoint positionInScene = [touch locationInNode:self];
        [self _selectNodeForTouch:positionInScene];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    CGPoint previousPosition = [touch previousLocationInNode:self];
    
    CGPoint translation = CGPointMake(positionInScene.x - previousPosition.x, positionInScene.y - previousPosition.y);
    
    [self _panForTranslation:translation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self _deselectNodeForTouch];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self _deselectNodeForTouch];
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
    if (self.selectedNode == nil)
    {
        return;
    }
    
    // Remove border
    [self.selectedNode removeAllChildren];
    
    [self _checkForObjectLock:self.selectedNode];
    
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
        // Check if renderingNode is close enough to lock into place
        CGFloat xDistance = fabsf(node.position.x - object.position.x);
        CGFloat yDistance = fabsf(node.position.y - object.position.y);
        
        if (xDistance <= kMaxLockDistance && yDistance <= kMaxLockDistance)
        {
            // Snap into place
            object.position = node.position;
            
            // Disable user interaction
            object.userInteractionEnabled = NO;
            object.physicsBody.pinned = YES;
            
            returnVal = YES;
            *stop = YES;
            
            // Lock animation
            SKAction *animation = [SKAction sequence:@[[SKAction scaleTo:1.2 duration:0.2], [SKAction scaleTo:1 duration:0.2]]];
            [object runAction:animation];
        }
    }];
    
    return returnVal;
}

- (BOOL)_isGameOver
{
    __block BOOL returnVal = YES;
    __block NSUInteger numNonPinned = 0;
    
    [self enumerateChildNodesWithName:@"square" usingBlock:^(SKNode *shapeNode, BOOL *stop) {
        if (shapeNode.physicsBody.pinned == NO)
        {
            numNonPinned++;
            
            if (numNonPinned > kSolutionNonPinned)
            {
                returnVal = NO;
                *stop = YES;
            }
            
            __block BOOL innerReturnVal = NO;
            [self enumerateChildNodesWithName:@"square-target-hidden" usingBlock:^(SKNode *targetNode, BOOL *stop) {
                CGFloat xDistance = fabsf(shapeNode.position.x - targetNode.position.x);
                CGFloat yDistance = fabsf(shapeNode.position.y - targetNode.position.y);
                
                if (xDistance <= kMaxLockDistance && yDistance <= kMaxLockDistance)
                {
                    innerReturnVal = YES;
                    *stop = YES;
                }
            }];
            
            if (innerReturnVal == NO)
            {
                returnVal = NO;
                *stop = YES;
            }
        }
    }];
    
    
    return returnVal;
}

#pragma mark - Helper methods
- (void)_segueToNextScene
{
    SKScene *scene = [Level4Scene unarchiveFromFile:@"Level4Scene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view presentScene:scene transition:[SKTransition fadeWithColor:[UIColor colorWithRed:13/255.0 green:13/255.0 blue:13/255.0 alpha:1] duration:2]];
    });
}


@end
