//
//  LevelSelectionViewController.h
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LevelSelectionViewControllerDelegate <NSObject>

- (void)didSelectLevel:(NSUInteger)level;

@end

@interface LevelSelectionViewController : UIViewController

@property (nonatomic, weak) id<LevelSelectionViewControllerDelegate> delegate;

@end
