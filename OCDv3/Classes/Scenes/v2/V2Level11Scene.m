//
//  V2Level11Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/27/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level11Scene.h"
#import "V2Level12Scene.h"

@implementation V2Level11Scene

- (SKScene *)nextLevelScene
{
    return [V2Level12Scene new];
}

@end
