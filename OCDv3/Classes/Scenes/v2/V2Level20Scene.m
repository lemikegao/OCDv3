//
//  V2Level20Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/28/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level20Scene.h"
#import "V2Level21Scene.h"

@implementation V2Level20Scene

- (SKScene *)nextLevelScene
{
    return [V2Level21Scene new];
}

@end
