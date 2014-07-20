//
//  LevelSelectionViewController.m
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "LevelSelectionViewController.h"

static const NSUInteger kNumSquareLevels = 16;
static const NSUInteger kNumTriangleLevels = 1;
static const NSUInteger kNumRotationLevels = 3;

@interface LevelSelectionViewController ()

@end

@implementation LevelSelectionViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return LevelSectionTypeNumSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case LevelSectionTypeTutorial:
            return 1;
            
        case LevelSectionTypeSquares:
            return kNumSquareLevels;
            
        case LevelSectionTypeTriangles:
            return kNumTriangleLevels;
            
        case LevelSectionTypeRotation:
            return kNumRotationLevels;
            
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case LevelSectionTypeTutorial:
            return @"Tutorial";
            
        case LevelSectionTypeSquares:
            return @"Squares";
            
        case LevelSectionTypeTriangles:
            return @"Triangles";
            
        case LevelSectionTypeRotation:
            return @"Rotation";
            
        default:
            return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *text;
    switch (indexPath.section) {
        case LevelSectionTypeTutorial:
            text = @"Tutorial";
            break;
            
        case LevelSectionTypeSquares:
        case LevelSectionTypeTriangles:
        case LevelSectionTypeRotation:
            text = [NSString stringWithFormat:@"Level %li", (long)indexPath.row+1];
            break;
            
        default:
            text = nil;
            break;
    }
    cell.textLabel.text = text;
    
    return cell;
}

- (void)_dismiss
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectLevelAtIndexPath:indexPath];
    
    [self _dismiss];
}

- (IBAction)pressedClose:(id)sender
{
    [self _dismiss];
}

@end
