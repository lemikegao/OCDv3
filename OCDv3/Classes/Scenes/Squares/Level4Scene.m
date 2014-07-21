//
//  Level4Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level4Scene.h"
#import "Level5Scene.h"

@implementation Level4Scene

- (NSUInteger)numObjects
{
    return 3;
}

- (SKScene *)nextLevelScene
{
    return [Level5Scene new];
}

@end