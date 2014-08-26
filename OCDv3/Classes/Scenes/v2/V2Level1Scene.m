//
//  V2Level1Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level1Scene.h"
#import "V2Level2Scene.h"

@implementation V2Level1Scene

- (SKScene *)nextLevelScene
{
    return [V2Level2Scene new];
}

@end
