//
//  RotationLevel3Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/6/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "RotationLevel3Scene.h"
#import "TutorialScene.h"

@implementation RotationLevel3Scene

- (NSUInteger)numObjects
{
    return 4;
}

- (SKScene *)nextLevelScene
{
    return [TutorialScene new];
}

@end