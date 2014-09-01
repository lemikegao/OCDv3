//
//  V2Level31Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level31Scene.h"
#import "V2Level32Scene.h"

@implementation V2Level31Scene

- (SKScene *)nextLevelScene
{
    return [V2Level32Scene new];
}

@end
