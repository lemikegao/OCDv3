//
//  Level5Scene.m
//  OCDv3
//
//  Created by Michael Gao on 6/23/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "Level5Scene.h"
#import "Level6Scene.h"

@implementation Level5Scene

- (NSUInteger)numObjects
{
    return 2;
}

- (SKScene *)nextLevelScene
{
    return [Level6Scene new];
}

@end