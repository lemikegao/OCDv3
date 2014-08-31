//
//  V2Level28Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/31/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level28Scene.h"
#import "V2Level29Scene.h"

@implementation V2Level28Scene

- (SKScene *)nextLevelScene
{
    return [V2Level29Scene new];
}

@end
