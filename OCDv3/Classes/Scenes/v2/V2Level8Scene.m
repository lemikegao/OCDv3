//
//  V2Level8Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level8Scene.h"
#import "V2Level9Scene.h"

@implementation V2Level8Scene

- (SKScene *)nextLevelScene
{
    return [V2Level9Scene new];
}

@end
