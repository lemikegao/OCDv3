//
//  V2Level39Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level39Scene.h"
#import "V2Level40Scene.h"

@implementation V2Level39Scene

- (SKScene *)nextLevelScene
{
    return [V2Level40Scene new];
}

@end
