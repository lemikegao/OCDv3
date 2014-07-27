//
//  TriangleLevel2Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TriangleLevel2Scene.h"
#import "RotationLevel1Scene.h"

@implementation TriangleLevel2Scene

- (NSUInteger)numObjects
{
    return 5;
}

- (SKScene *)nextLevelScene
{
    return [RotationLevel1Scene new];
}

@end
