//
//  V2Level42Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/2/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level42Scene.h"
#import "V2Level43Scene.h"

@implementation V2Level42Scene

- (SKScene *)nextLevelScene
{
    return [V2Level43Scene new];
}

@end
