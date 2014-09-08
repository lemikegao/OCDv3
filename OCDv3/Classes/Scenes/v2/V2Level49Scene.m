//
//  V2Level49Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/8/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level49Scene.h"
#import "V2Level50Scene.h"

@implementation V2Level49Scene

- (SKScene *)nextLevelScene
{
    return [V2Level50Scene new];
}

@end
