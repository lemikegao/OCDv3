//
//  RotationLevel1.m
//  OCDv3
//
//  Created by Michael Gao on 7/5/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "RotationLevel1Scene.h"
#import "RotationLevel2Scene.h"

@implementation RotationLevel1Scene

- (NSUInteger)numObjects
{
    return 1;
}

- (SKScene *)nextLevelScene
{
    return [RotationLevel2Scene new];
}

@end