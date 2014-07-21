//
//  Level14Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level14Scene.h"
#import "Level15Scene.h"

@implementation Level14Scene

- (NSUInteger)numObjects
{
    return 3;
}

- (SKScene *)nextLevelScene
{
    return [Level15Scene new];
}

@end