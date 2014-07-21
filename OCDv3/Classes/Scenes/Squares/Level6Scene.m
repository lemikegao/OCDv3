//
//  Level6Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level6Scene.h"
#import "Level7Scene.h"

@implementation Level6Scene

- (NSUInteger)numObjects
{
    return 4;
}

- (SKScene *)nextLevelScene
{
    return [Level7Scene new];
}

@end