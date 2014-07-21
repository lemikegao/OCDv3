//
//  Level1Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level1Scene.h"
#import "Level2Scene.h"

@implementation Level1Scene

- (NSUInteger)numObjects
{
    return 1;
}

- (SKScene *)nextLevelScene
{
    return [Level2Scene new];
}

@end