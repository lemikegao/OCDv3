//
//  OCDSquareLevelScene.m
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "OCDSquareLevelScene.h"

@implementation OCDSquareLevelScene

- (void)didMoveToView:(SKView *)view
{
    [super didMoveToView:view];
    
    // Hide all hidden targets
    [self enumerateChildNodesWithName:@"square-target-hidden" usingBlock:^(SKNode *node, BOOL *stop) {
        node.zPosition = -1;
        node.hidden = YES;
    }];
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    CGFloat borderWidth = 36;
    return [SKSpriteNode spriteNodeWithColor:[node.color colorWithAlphaComponent:0.5] size:CGSizeMake(node.size.width + borderWidth, node.size.height + borderWidth)];

}

@end
