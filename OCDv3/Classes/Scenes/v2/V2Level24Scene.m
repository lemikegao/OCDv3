//
//  V2Level24Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/30/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level24Scene.h"
#import "V2Level25Scene.h"

@implementation V2Level24Scene

- (SKScene *)nextLevelScene
{
    return [V2Level25Scene new];
}

@end
