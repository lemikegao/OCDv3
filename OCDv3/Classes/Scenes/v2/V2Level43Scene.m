//
//  V2Level43Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/2/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level43Scene.h"
#import "V2Level44Scene.h"

@implementation V2Level43Scene

- (SKScene *)nextLevelScene
{
    return [V2Level44Scene new];
}

@end
