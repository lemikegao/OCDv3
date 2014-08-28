//
//  V2Level17Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level17Scene.h"
//#import "V2Level18Scene.h"
#import "V2TutorialScene.h"

@implementation V2Level17Scene

- (SKScene *)nextLevelScene
{
//    return [V2Level18Scene new];
#warning - Uncomment
    return [V2TutorialScene new];
}

@end
