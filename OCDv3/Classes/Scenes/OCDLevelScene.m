//
//  OCDLevelScene.m
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "OCDLevelScene.h"

NSString *const OCDLevelSceneBorderName = @"OCDLevelSceneBorderName";
CGFloat const OCDLevelSceneMaxLockDistance = 20;

@interface OCDLevelScene()

@property (nonatomic, weak) SKSpriteNode *selectedNode;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSInteger numObjectsLocked;
@property (nonatomic, strong) UITouch *currentTouch;

@end

@implementation OCDLevelScene

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        _numObjects = 0;
        _selectedNode = nil;
        _gameOver = NO;
        _numObjectsLocked = 0;
        _currentTouch = nil;
    }
    
    return self;
}

- (NSUInteger)numObjects
{
    NSAssert(NO, @"This getter needs to be overridden: numObjects");
    return _numObjects;
}

-(void)didMoveToView:(SKView *)view
{
    CGRect frame = self.frame;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(frame.origin.x - 75, frame.origin.y - 75, frame.size.width + 150, frame.size.height + 150)];
}

#pragma mark - Methods to override by subclass
- (BOOL)needsCustomBorderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    return NO;
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    NSAssert(NO, @"This method must be overridden: borderForSpriteNode:locked:");
    return nil;
}

- (SKScene *)nextLevelScene
{
    NSAssert(NO, @"This method must be overridden: nextLevelScene");
    return nil;
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
        if ([touchedNode.name isEqualToString:OCDLevelSceneBorderName])
        {
            touchedNode = (SKSpriteNode*)touchedNode.parent;
        }
        self.selectedNode = touchedNode;
        
        // Add border
        SKSpriteNode *border = [self borderForSpriteNode:touchedNode locked:NO];
        border.userInteractionEnabled = NO;
        border.name = OCDLevelSceneBorderName;
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
        // Remove border if object did not lock
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
    __block BOOL retVal = NO;
    
    [self enumerateChildNodesWithName:[NSString stringWithFormat:@"%@-target", object.name] usingBlock:^(SKNode *node, BOOL *stop) {
        if ([self shouldLockObject:object withPossibleTarget:node])
        {
            [self _lockObject:object withTarget:node];
            retVal = *stop = YES;
        }
    }];
    
    if (retVal == NO)
    {
        [self enumerateChildNodesWithName:[NSString stringWithFormat:@"%@-target-hidden", object.name] usingBlock:^(SKNode *node, BOOL *stop) {
            if ([self shouldLockObject:object withPossibleTarget:node])
            {
                [self _lockObject:object withTarget:node];
                retVal = *stop = YES;
            }
        }];
    }
    
    return retVal;
}

- (BOOL)shouldLockObject:(SKSpriteNode *)object withPossibleTarget:(SKNode *)possibleTarget
{
    if ([object.color isEqual:[(SKSpriteNode *)possibleTarget color]])
    {
        // Check if renderingNode is close enough to lock into place
        CGFloat xDistance = fabsf(possibleTarget.position.x - object.position.x);
        CGFloat yDistance = fabsf(possibleTarget.position.y - object.position.y);
        
        if (xDistance <= OCDLevelSceneMaxLockDistance && yDistance <= OCDLevelSceneMaxLockDistance)
        {
            return YES;
        }
    }
    
    return NO;
}

- (void)_lockObject:(SKSpriteNode *)object withTarget:(SKNode *)target
{
    self.numObjectsLocked++;
    
    // Snap into place
    object.position = target.position;
    object.zPosition = -1;
    
    // Disable user interaction
    object.userInteractionEnabled = NO;
    object.physicsBody.pinned = YES;
    
    // Shrink border animation
    if ([self needsCustomBorderForSpriteNode:object locked:YES])
    {
        // Remove any existing borders
        [object removeAllChildren];
        
        // Add new locked border
        SKSpriteNode *border = [self borderForSpriteNode:object locked:YES];
        border.userInteractionEnabled = NO;
        border.physicsBody.pinned = YES;
        border.zPosition = -10;
        [object addChild:border];
    }
    else
    {
        // Shrink border
        SKSpriteNode *border = (SKSpriteNode *)[object childNodeWithName:OCDLevelSceneBorderName];
        SKAction *shrinkBorderAction = [SKAction scaleTo:0.95 duration:0.4];
        [border runAction:shrinkBorderAction];
    }
    
    // Remove target
    target.hidden = YES;
    
    // Lock animation
    SKAction *animation = [SKAction sequence:@[[SKAction scaleTo:1.2 duration:0.2], [SKAction scaleTo:1 duration:0.2]]];
    [object runAction:animation];
}

- (BOOL)_isGameOver
{
    return self.numObjectsLocked == self.numObjects;
}

#pragma mark - Helper methods
- (void)_segueToNextScene
{
    SKScene *tempScene = [self nextLevelScene];
    SKScene *scene = [tempScene unarchiveFromFile:NSStringFromClass([tempScene class])];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view presentScene:scene transition:[SKTransition fadeWithColor:[UIColor colorWithRed:13/255.0 green:13/255.0 blue:13/255.0 alpha:1] duration:1]];
    });
}

@end