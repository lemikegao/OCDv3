//
//  TriangleLevel5Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/27/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TriangleLevel5Scene.h"
#import "RotationLevel1Scene.h"

@implementation TriangleLevel5Scene

- (NSUInteger)numObjects
{
    return 9;
}

- (SKScene *)nextLevelScene
{
    return [RotationLevel1Scene new];
}

@end
