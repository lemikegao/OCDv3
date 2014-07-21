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

@end
