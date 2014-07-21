//
//  Level3Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level3Scene.h"
#import "Level4Scene.h"

@implementation Level3Scene

- (NSUInteger)numObjects
{
    return 3;
}

- (SKScene *)nextLevelScene
{
    return [Level4Scene new];
}

@end