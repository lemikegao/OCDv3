//
//  LevelSelectionViewController.m
//  OCDv3
//
//  Created by Michael Gao on 6/21/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "LevelSelectionViewController.h"

static const NSUInteger kNumLevels = 11;

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumLevels;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Level %li", (long)indexPath.row+1];
    
    return cell;
}

- (void)_dismiss
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectLevel:indexPath.row+1];
    
    [self _dismiss];
}

- (IBAction)pressedClose:(id)sender
{
    [self _dismiss];
}

@end
