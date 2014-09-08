//
//  V2Level45Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/2/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level45Scene.h"
#import "V2Level46Scene.h"

@implementation V2Level45Scene

- (SKScene *)nextLevelScene
{
    return [V2Level46Scene new];
}

@end
