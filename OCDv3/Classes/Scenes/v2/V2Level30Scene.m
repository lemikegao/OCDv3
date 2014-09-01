//
//  V2Level30Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/31/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level30Scene.h"
#import "V2Level31Scene.h"

@implementation V2Level30Scene

- (SKScene *)nextLevelScene
{
    return [V2Level31Scene new];
}

@end
