//
//  Level10Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/24/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level10Scene.h"
#import "Level11Scene.h"

@implementation Level10Scene

- (NSUInteger)numObjects
{
    return 3;
}

- (SKScene *)nextLevelScene
{
    return [Level11Scene new];
}

@end