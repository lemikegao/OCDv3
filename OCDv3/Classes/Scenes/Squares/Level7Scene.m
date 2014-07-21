//
//  Level7Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level7Scene.h"
#import "Level8Scene.h"

@implementation Level7Scene

- (NSUInteger)numObjects
{
    return 5;
}

- (SKScene *)nextLevelScene
{
    return [Level8Scene new];
}

@end