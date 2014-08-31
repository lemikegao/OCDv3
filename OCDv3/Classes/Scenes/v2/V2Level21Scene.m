//
//  V2Level21Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/30/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level21Scene.h"
#import "V2Level22Scene.h"

@implementation V2Level21Scene

- (SKScene *)nextLevelScene
{
    return [V2Level22Scene new];
}

@end
