//
//  V2Level15Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/27/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level15Scene.h"
#import "V2TutorialScene.h"

@implementation V2Level15Scene

- (SKScene *)nextLevelScene
{
    return [V2TutorialScene new];
}

@end
