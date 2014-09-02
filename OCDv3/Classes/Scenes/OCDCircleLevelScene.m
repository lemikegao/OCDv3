//
//  OCDCircleLevelScene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "OCDCircleLevelScene.h"

@implementation OCDCircleLevelScene

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    // Hide all hidden targets
    [self enumerateChildNodesWithName:@"circle-target-hidden" usingBlock:^(SKNode *node, BOOL *stop) {
        node.zPosition = -1;
        node.hidden = YES;
    }];
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    if ([node.name isEqual:@"circle"])
    {
        CGFloat borderWidth = 18;
        SKSpriteNode *border = [SKSpriteNode spriteNodeWithImageNamed:@"circle"];
        border.color = [node.color colorWithAlphaComponent:0.5];
        border.colorBlendFactor = 1;
        border.size = CGSizeMake(node.size.width + borderWidth, node.size.height + borderWidth);
        
        return border;
    }
    
    return [super borderForSpriteNode:node locked:locked];
}

@end
