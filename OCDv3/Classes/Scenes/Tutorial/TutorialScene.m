//
//  TutorialScene.m
//  OCDv3
//
//  Created by Michael Gao on 6/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TutorialScene.h"
#import "Level1Scene.h"

@implementation TutorialScene

- (NSUInteger)numObjects
{
    return 3;
}

- (BOOL)needsCustomBorderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    return YES;
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    NSString *suffix = locked ? @"-border-locked" : @"-border";
    SKSpriteNode *border = [SKSpriteNode spriteNodeWithImageNamed:[node.name stringByAppendingString:suffix]];
    border.color = node.color;
    border.colorBlendFactor = 1;

    return border;
}

- (SKScene *)nextLevelScene
{
    return [Level1Scene new];
}

@end
