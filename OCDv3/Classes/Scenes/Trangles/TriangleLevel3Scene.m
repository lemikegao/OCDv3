//
//  TriangleLevel3Scene.m
//  OCDv3
//
//  Created by Michael Gao on 7/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "TriangleLevel3Scene.h"
#import "TriangleLevel4Scene.h"

@implementation TriangleLevel3Scene

- (NSUInteger)numObjects
{
    return 10;
}

- (SKScene *)nextLevelScene
{
    return [TriangleLevel4Scene new];
}

@end
