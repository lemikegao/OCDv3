//
//  V2Level10Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level10Scene.h"
#import "V2TutorialScene.h"

@implementation V2Level10Scene

- (SKScene *)nextLevelScene
{
    return [V2TutorialScene new];
}

@end
