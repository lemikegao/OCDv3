//
//  V2Level48Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/8/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level48Scene.h"
#import "V2Level49Scene.h"

@implementation V2Level48Scene

- (SKScene *)nextLevelScene
{
    return [V2Level49Scene new];
}

@end
