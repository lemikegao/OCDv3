//
//  OCDTriangleLevelScene.m
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "OCDTriangleLevelScene.h"

@implementation OCDTriangleLevelScene

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    // Hide all hidden targets
    [self enumerateChildNodesWithName:@"triangle-target-hidden" usingBlock:^(SKNode *node, BOOL *stop) {
        node.zPosition = -1;
        node.hidden = YES;
    }];
}

- (BOOL)shouldLockObject:(SKSpriteNode *)object withPossibleTarget:(SKNode *)possibleTarget
{
    CGFloat objectRotation = object.zRotation < 0 ? object.zRotation + 2*M_PI : object.zRotation;
    CGFloat targetRotation = possibleTarget.zRotation < 0 ? possibleTarget.zRotation + 2*M_PI : possibleTarget.zRotation;
    
    // Round angles to 2 decimal places
    objectRotation = floorf(objectRotation * 100) / 100;
    targetRotation = floorf(targetRotation * 100) / 100;
    
    // Make sure the triangles are set at the same angle
    return (objectRotation == targetRotation && [super shouldLockObject:object withPossibleTarget:possibleTarget]);
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    if ([node.name isEqual:@"triangle"])
    {
        CGFloat borderWidth = 26;
        SKSpriteNode *border = [SKSpriteNode spriteNodeWithImageNamed:@"triangle"];
        border.color = [node.color colorWithAlphaComponent:0.5];
        border.colorBlendFactor = 1;
        border.size = CGSizeMake(node.size.width + borderWidth, node.size.height + borderWidth);
        border.anchorPoint = CGPointMake(0.47, 0.52);
    
        return border;
    }
    
    return [super borderForSpriteNode:node locked:locked];
}

@end
