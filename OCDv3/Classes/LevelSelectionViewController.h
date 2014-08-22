//
//  LevelSelectionViewController.h
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LevelSectionType)
{
    LevelSectionTypeTutorial = 0,
    LevelSectionTypeSquares,
    LevelSectionTypeTriangles,
    LevelSectionTypeRotation,
    LevelSectionTypeNumSections
};

typedef NS_ENUM(NSInteger, ToggleState)
{
    ToggleStateNew = 0,
    ToggleStateOld,
};

@protocol LevelSelectionViewControllerDelegate <NSObject>

- (void)didSelectLevelAtIndexPath:(NSIndexPath *)indexPath toggleState:(ToggleState)state;

@end

@interface LevelSelectionViewController : UIViewController

@property (nonatomic, weak) id<LevelSelectionViewControllerDelegate> delegate;

@end
