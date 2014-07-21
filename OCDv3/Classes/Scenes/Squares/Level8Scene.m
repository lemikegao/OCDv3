//
//  Level8Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level8Scene.h"
#import "Level9Scene.h"

@implementation Level8Scene

- (NSUInteger)numObjects
{
    return 9;
}

- (SKScene *)nextLevelScene
{
    return [Level9Scene new];
}

@end