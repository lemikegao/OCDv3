//
//  V2TutorialScene.m
//  OCDv3
//
//  Created by Michael Gao on 8/22/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "V2TutorialScene.h"
#import "V2Level1Scene.h"

@interface V2TutorialScene()

@property (nonatomic, strong) SKTextureAtlas *atlas;

@end

@implementation V2TutorialScene

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _atlas = [SKTextureAtlas atlasNamed:@"Assets"];
        [SKTextureAtlas preloadTextureAtlases:@[_atlas] withCompletionHandler:^{

        }];
    }
    
    return self;
}

- (NSUInteger)numObjects
{
    return 3;
}

- (BOOL)needsCustomBorderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    return YES;
}

- (SKSpriteNode *)borderForSpriteNode:(SKSpriteNode *)node locked:(BOOL)locked
{
    NSString *suffix = locked ? @"-border-locked" : @"-border";
    SKSpriteNode *border = [SKSpriteNode spriteNodeWithTexture:[self.atlas textureNamed:[node.name stringByAppendingString:suffix]]];
    border.color = node.color;
    border.colorBlendFactor = 1;
    
    return border;
}

- (SKScene *)nextLevelScene
{
    return [V2Level1Scene new];
}

@end
