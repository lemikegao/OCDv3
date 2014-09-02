//
//  V2Level40Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level40Scene.h"
#import "V2Level41Scene.h"

@implementation V2Level40Scene

- (SKScene *)nextLevelScene
{
    return [V2Level41Scene new];
}

@end
