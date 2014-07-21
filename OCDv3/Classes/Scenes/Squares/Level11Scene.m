//
//  Level11Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/24/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level11Scene.h"
#import "Level12Scene.h"

@implementation Level11Scene

- (NSUInteger)numObjects
{
    return 5;
}

- (SKScene *)nextLevelScene
{
    return [Level12Scene new];
}

@end