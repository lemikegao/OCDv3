//
//  TutorialScene.m
//  OCDv3
//
//  Created by Michael Gao on 6/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TutorialScene.h"
#import "Level1Scene.h"
static NSString *const kBorderName = @"kBorderName";

static CGFloat const kMaxLockDistance = 24;
static CGFloat const kNumObjects = 3;

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

@interface TutorialScene()

@property (nonatomic, strong) SKTextureAtlas *atlas;
@property (nonatomic, weak) SKSpriteNode *selectedNode;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSInteger numObjectsLocked;
@property (nonatomic, strong) UITouch *currentTouch;

@end

@implementation TutorialScene

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        _atlas = [SKTextureAtlas atlasNamed:@"Assets"];
        _currentTouch = nil;
    }
    
    return self;
}

-(void)didMoveToView:(SKView *)view
{
    _numObjectsLocked = 0;
    _gameOver = NO;
    
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
    BOOL shouldSelectNode = NO;
    
    if ([touchedNode isKindOfClass:[SKSpriteNode class]] && touchedNode.physicsBody && touchedNode.physicsBody.pinned == NO)
    {
        if ([touchedNode.name isEqualToString:kBorderName])
        {
            touchedNode = (SKSpriteNode*)touchedNode.parent;
        }
        self.selectedNode = touchedNode;
        
        NSString *fileName = @"ocd-letter-";
        if ([touchedNode.name isEqualToString:@"letter-o"])
        {
            fileName = [fileName stringByAppendingString:@"o-border"];
            shouldSelectNode = YES;
        }
        else if ([touchedNode.name isEqualToString:@"letter-c"])
        {
            fileName = [fileName stringByAppendingString:@"c-border"];
            shouldSelectNode = YES;
        }
        else if ([touchedNode.name isEqualToString:@"letter-d"])
        {
            fileName = [fileName stringByAppendingString:@"d-border"];
            shouldSelectNode = YES;
        }
        
        if (shouldSelectNode)
        {
            // Add border
            SKSpriteNode *border = [SKSpriteNode spriteNodeWithImageNamed:fileName];
            border.color = touchedNode.color;
            border.colorBlendFactor = 1;
            border.size = CGSizeMake(border.size.width * 2, border.size.height * 2);
            border.name = kBorderName;
            border.position = CGPointZero;
            border.zPosition = -10;
            [touchedNode addChild:border];
        }
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
    SKNode *target = [self childNodeWithName:[NSString stringWithFormat:@"%@-target", object.name]];
    // Check if renderingNode is close enough to lock into place
    CGFloat xDistance = fabsf(target.position.x - object.position.x);
    CGFloat yDistance = fabsf(target.position.y - object.position.y);
    
    if (xDistance <= kMaxLockDistance && yDistance <= kMaxLockDistance)
    {
        self.numObjectsLocked++;
        
        // Snap into place
        object.position = target.position;
        
        // Disable user interaction
        object.userInteractionEnabled = NO;
        object.physicsBody.pinned = YES;
        
        // Add locked border
        SKSpriteNode *lockedBorder = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"ocd-%@-border-locked", object.name]];
        lockedBorder.userInteractionEnabled = NO;
        lockedBorder.physicsBody.pinned = YES;
        lockedBorder.zPosition = -10;
        lockedBorder.color = object.color;
        lockedBorder.colorBlendFactor = 1;
        lockedBorder.size = CGSizeMake(lockedBorder.size.width * 2, lockedBorder.size.height * 2);
        [object addChild:lockedBorder];
        
        // Remove target
        [target removeFromParent];
        
        // Lock animation
        SKAction *lockAnimation = [SKAction sequence:@[[SKAction scaleTo:1.2 duration:0.2], [SKAction scaleTo:1 duration:0.2]]];
        [object runAction:lockAnimation];
        
        return YES;
    }
    
    return NO;
}

- (BOOL)_isGameOver
{
    return self.numObjectsLocked == kNumObjects;
}

#pragma mark - Helper methods
- (void)_segueToNextScene
{
    SKScene *scene = [Level1Scene unarchiveFromFile:@"Level1Scene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view presentScene:scene transition:[SKTransition fadeWithColor:[UIColor colorWithRed:13/255.0 green:13/255.0 blue:13/255.0 alpha:1] duration:1]];
    });
}

@end