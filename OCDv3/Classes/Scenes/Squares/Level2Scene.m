//
//  Level2Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level2Scene.h"
#import "Level3Scene.h"

@implementation Level2Scene

- (NSUInteger)numObjects
{
    return 2;
}

- (SKScene *)nextLevelScene
{
    return [Level3Scene new];
}

@end