//
//  V2Level1Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level1Scene.h"

@implementation V2Level1Scene

- (NSUInteger)numObjects
{
    return 1;
}

- (SKScene *)nextLevelScene
{
    return [Level2Scene new];
}

@end
