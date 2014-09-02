//
//  V2Level38Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level38Scene.h"
#import "V2Level39Scene.h"

@implementation V2Level38Scene

- (SKScene *)nextLevelScene
{
    return [V2Level39Scene new];
}

@end
