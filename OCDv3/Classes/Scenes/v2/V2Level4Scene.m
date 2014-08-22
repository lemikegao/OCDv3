//
//  V2Level4Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level4Scene.h"
#import "V2Level5Scene.h"

@implementation V2Level4Scene

- (NSUInteger)numObjects
{
    return 4;
}

- (SKScene *)nextLevelScene
{
    return [V2Level5Scene new];
}

@end
