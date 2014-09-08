//
//  V2Level46Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/8/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level46Scene.h"
#import "V2Level47Scene.h"

@implementation V2Level46Scene

- (SKScene *)nextLevelScene
{
    return [V2Level47Scene new];
}

@end
