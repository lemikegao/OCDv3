//
//  V2Level3Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level3Scene.h"
#import "V2Level4Scene.h"

@implementation V2Level3Scene

- (SKScene *)nextLevelScene
{
    return [V2Level4Scene new];
}

@end
