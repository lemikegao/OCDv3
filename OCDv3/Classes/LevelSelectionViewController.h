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
    LevelSectionTypeRotation,
    LevelSectionTypeNumSections
};

@protocol LevelSelectionViewControllerDelegate <NSObject>

- (void)didSelectLevelAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LevelSelectionViewController : UIViewController

@property (nonatomic, weak) id<LevelSelectionViewControllerDelegate> delegate;

@end
