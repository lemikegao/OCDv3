//
//  Level16Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level16Scene.h"
#import "TriangleLevel1Scene.h"

@implementation Level16Scene

- (NSUInteger)numObjects
{
    return 13;
}

- (SKScene *)nextLevelScene
{
    return [TriangleLevel1Scene new];
}

@end