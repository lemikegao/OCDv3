//
//  V2Level25Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/30/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level25Scene.h"
#import "V2Level26Scene.h"

@implementation V2Level25Scene

- (SKScene *)nextLevelScene
{
    return [V2Level26Scene new];
}

@end
