//
//  V2Level16Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level16Scene.h"
#import "V2Level17Scene.h"

@implementation V2Level16Scene

- (SKScene *)nextLevelScene
{
    return [V2Level17Scene new];
}

@end
