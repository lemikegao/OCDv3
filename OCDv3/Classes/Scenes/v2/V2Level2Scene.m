//
//  V2Level2Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level2Scene.h"
#import "V2Level3Scene.h"

@implementation V2Level2Scene

- (NSUInteger)numObjects
{
    return 2;
}

- (SKScene *)nextLevelScene
{
    return [V2Level3Scene new];
}

@end
