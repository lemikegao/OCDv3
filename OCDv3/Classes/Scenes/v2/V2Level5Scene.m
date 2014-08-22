//
//  V2Level5Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level5Scene.h"
#import "V2TutorialScene.h"

@implementation V2Level5Scene

- (NSUInteger)numObjects
{
    return 3;
}

- (SKScene *)nextLevelScene
{
    return [V2TutorialScene new];
}

@end
