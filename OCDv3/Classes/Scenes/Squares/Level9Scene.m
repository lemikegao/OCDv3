//
//  Level9Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level9Scene.h"
#import "Level10Scene.h"

@implementation Level9Scene

- (NSUInteger)numObjects
{
    return 2;
}

- (SKScene *)nextLevelScene
{
    return [Level10Scene new];
}

@end