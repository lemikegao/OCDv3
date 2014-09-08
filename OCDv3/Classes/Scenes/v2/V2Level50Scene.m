//
//  V2Level50Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/8/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level50Scene.h"
#import "V2TutorialScene.h"

@implementation V2Level50Scene

- (SKScene *)nextLevelScene
{
    return [V2TutorialScene new];
}

@end
