//
//  V2Level18Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level18Scene.h"
#import "V2Level19Scene.h"

@implementation V2Level18Scene

- (SKScene *)nextLevelScene
{
    return [V2Level19Scene new];
}

@end
