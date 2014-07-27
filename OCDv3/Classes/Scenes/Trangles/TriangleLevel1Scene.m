//
//  TriangleLevel1Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TriangleLevel1Scene.h"
#import "TriangleLevel2Scene.h"

@implementation TriangleLevel1Scene

- (NSUInteger)numObjects
{
    return 6;
}

- (SKScene *)nextLevelScene
{
    return [TriangleLevel2Scene new];
}

@end