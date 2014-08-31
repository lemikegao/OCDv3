//
//  V2Level23Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/30/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level23Scene.h"
#import "V2Level24Scene.h"

@implementation V2Level23Scene

- (SKScene *)nextLevelScene
{
    return [V2Level24Scene new];
}

@end
