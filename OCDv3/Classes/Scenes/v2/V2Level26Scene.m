//
//  V2Level26Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/31/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level26Scene.h"
#import "V2Level27Scene.h"

@implementation V2Level26Scene

- (SKScene *)nextLevelScene
{
    return [V2Level27Scene new];
}

@end
