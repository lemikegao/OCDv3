//
//  Level15Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level15Scene.h"
#import "Level16Scene.h"

@implementation Level15Scene

- (NSUInteger)numObjects
{
    return 9;
}

- (SKScene *)nextLevelScene
{
    return [Level16Scene new];
}

@end