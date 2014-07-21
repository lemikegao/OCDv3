//
//  Level12Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/25/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level12Scene.h"
#import "Level13Scene.h"

@implementation Level12Scene

- (NSUInteger)numObjects
{
    return 6;
}

- (SKScene *)nextLevelScene
{
    return [Level13Scene new];
}

@end