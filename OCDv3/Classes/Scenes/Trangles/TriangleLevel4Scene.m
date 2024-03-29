//
//  TriangleLevel4Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TriangleLevel4Scene.h"
#import "TriangleLevel5Scene.h"

@implementation TriangleLevel4Scene

- (NSUInteger)numObjects
{
    return 9;
}

- (SKScene *)nextLevelScene
{
    return [TriangleLevel5Scene new];
}

@end
