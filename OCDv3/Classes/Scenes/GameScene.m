//
//  GameScene.m
//  OCDv3
//
//  Created by Michael Gao on 6/19/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "GameScene.h"

static CGFloat const kMaxLockDistance = 10;
static CGFloat const kSolutionNonPinned = 2;

@interface GameScene()

@property (nonatomic, weak) SKSpriteNode *selectedNode;
@property (nonatomic, weak) SKLabelNode *congratsLabel;
@property (nonatomic) BOOL gameOver;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    _gameOver = NO;
    _congratsLabel = (SKLabelNode *)[self childNodeWithName:@"congrats-label"];
    _congratsLabel.userInteractionEnabled = NO;
    _congratsLabel.hidden = YES;
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
    
    if ([touchedNode isKindOfClass:[SKSpriteNode class]] && touchedNode.physicsBody.pinned == NO)
    {
        self.selectedNode = touchedNode;
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
    
    [self _checkForObjectLock:self.selectedNode];
    
    self.selectedNode = nil;
    
    if ([self _isGameOver])
    {
        _gameOver = YES;
        _congratsLabel.hidden = NO;
    }
}

- (BOOL)_checkForObjectLock:(SKSpriteNode *)object
{
    __block BOOL returnVal = NO;
    [self enumerateChildNodesWithName:@"square-dotted" usingBlock:^(SKNode *node, BOOL *stop) {
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

@end
