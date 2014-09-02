//
//  V2Level36Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level36Scene.h"
#import "V2Level37Scene.h"

@implementation V2Level36Scene

- (SKScene *)nextLevelScene
{
    return [V2Level37Scene new];
}

@end
