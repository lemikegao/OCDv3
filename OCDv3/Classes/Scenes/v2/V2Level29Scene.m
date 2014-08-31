//
//  V2Level29Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/31/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level29Scene.h"
#import "V2Level30Scene.h"

@implementation V2Level29Scene

- (SKScene *)nextLevelScene
{
    return [V2Level30Scene new];
}

@end
