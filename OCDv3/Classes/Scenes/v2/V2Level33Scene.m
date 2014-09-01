//
//  V2Level33Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level33Scene.h"
#import "V2Level34Scene.h"

@implementation V2Level33Scene

- (SKScene *)nextLevelScene
{
    return [V2Level34Scene new];
}

@end
