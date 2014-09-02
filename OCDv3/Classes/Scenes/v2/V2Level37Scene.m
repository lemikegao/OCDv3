//
//  V2Level37Scene.m
//  OCDv3
//
//  Created by Michael Gao on 9/1/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level37Scene.h"
#import "V2Level38Scene.h"

@implementation V2Level37Scene

- (SKScene *)nextLevelScene
{
    return [V2Level38Scene new];
}

@end
