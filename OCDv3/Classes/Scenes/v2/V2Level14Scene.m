//
//  V2Level14Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/27/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level14Scene.h"
#import "V2Level15Scene.h"

@implementation V2Level14Scene

- (SKScene *)nextLevelScene
{
    return [V2Level15Scene new];
}

@end
