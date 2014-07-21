//
//  OCDLevelScene.h
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKScene+Unarchive.h"

extern NSString *const OCDLevelSceneBorderName;
extern CGFloat const OCDLevelScenceMaxLockDistance;

@interface OCDLevelScene : SKScene

// Properties to override by subclass
@property (nonatomic) NSUInteger numObjects;

// Methods to override by subclass
/// Some objects need a special asset for a dragged/locked border (example: Letters O, C, D)
- (BOOL)needsCustomBorderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked;
- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked;

/// Return filename for next level scene
- (SKScene *)nextLevelScene;

@end
