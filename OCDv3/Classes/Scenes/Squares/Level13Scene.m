//
//  Level13Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level13Scene.h"
#import "Level14Scene.h"

@implementation Level13Scene

- (NSUInteger)numObjects
{
    return 9;
}

- (SKScene *)nextLevelScene
{
    return [Level14Scene new];
}

@end