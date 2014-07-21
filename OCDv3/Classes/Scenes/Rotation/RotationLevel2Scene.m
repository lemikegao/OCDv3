//
//  RotationLevel2Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/6/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "RotationLevel2Scene.h"
#import "RotationLevel3Scene.h"

@implementation RotationLevel2Scene

- (NSUInteger)numObjects
{
    return 2;
}

- (SKScene *)nextLevelScene
{
    return [RotationLevel3Scene new];
}

@end