//
//  LevelSelectionViewController.m
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "LevelSelectionViewController.h"

static const NSUInteger kNumSquareLevels = 16;
static const NSUInteger kNumTriangleLevels = 5;
static const NSUInteger kNumRotationLevels = 3;
static const NSInteger kNumv2Levels = 51;

@interface LevelSelectionViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *toggle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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

- (IBAction)pressedToggle:(id)sender
{
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.toggle.selectedSegmentIndex == ToggleStateOld)
    {
        return LevelSectionTypeNumSections;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.toggle.selectedSegmentIndex == ToggleStateOld)
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

    return kNumv2Levels;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.toggle.selectedSegmentIndex == ToggleStateOld)
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
    
    return nil;
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
    if (self.toggle.selectedSegmentIndex == ToggleStateOld)
    {
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
    }
    else
    {
        text = indexPath.row == 0 ? @"Tutorial" : [NSString stringWithFormat:@"Level %li", (long)indexPath.row];
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
    [self.delegate didSelectLevelAtIndexPath:indexPath toggleState:self.toggle.selectedSegmentIndex];
    
    [self _dismiss];
}

- (IBAction)pressedClose:(id)sender
{
    [self _dismiss];
}

@end
