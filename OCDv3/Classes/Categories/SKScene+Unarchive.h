//
//  SKScene+Unarchive.h
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKScene (Unarchive)

+(instancetype)unarchiveFromFile:(NSString *)file;
- (instancetype)unarchiveFromFile:(NSString *)file;

@end
