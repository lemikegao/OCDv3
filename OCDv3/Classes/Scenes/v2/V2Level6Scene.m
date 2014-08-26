//
//  V2Level6Scene.m
//  OCDv3
//
//  Created by Michael Gao on 8/26/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2Level6Scene.h"
#import "V2Level7Scene.h"

@implementation V2Level6Scene

- (SKScene *)nextLevelScene
{
    return [V2Level7Scene new];
}

@end
