//
//  V2Level35Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level35Scene.h"
#import "V2Level36Scene.h"

@implementation V2Level35Scene

- (SKScene *)nextLevelScene
{
    return [V2Level36Scene new];
}

@end
