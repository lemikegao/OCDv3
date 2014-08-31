//
//  GameViewController.m
//  OCDv3
//
//  Created by Michael Gao on 6/19/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "GameViewController.h"
#import "LevelSelectionViewController.h"
#import "SKScene+Unarchive.h"

// V2
#import "V2TutorialScene.h"
#import "V2Level1Scene.h"
#import "V2Level2Scene.h"
#import "V2Level3Scene.h"
#import "V2Level4Scene.h"
#import "V2Level5Scene.h"
#import "V2Level6Scene.h"
#import "V2Level7Scene.h"
#import "V2Level8Scene.h"
#import "V2Level9Scene.h"
#import "V2Level10Scene.h"
#import "V2Level11Scene.h"
#import "V2Level12Scene.h"
#import "V2Level13Scene.h"
#import "V2Level14Scene.h"
#import "V2Level15Scene.h"
#import "V2Level16Scene.h"
#import "V2Level17Scene.h"
#import "V2Level18Scene.h"
#import "V2Level19Scene.h"
#import "V2Level20Scene.h"
#import "V2Level21Scene.h"
#import "V2Level22Scene.h"
#import "V2Level23Scene.h"
#import "V2Level24Scene.h"
#import "V2Level25Scene.h"
#import "V2Level26Scene.h"
#import "V2Level27Scene.h"
#import "V2Level28Scene.h"
#import "V2Level29Scene.h"
#import "V2Level30Scene.h"

// Tutorial
#import "TutorialScene.h"

// Squares
#import "Level1Scene.h"
#import "Level2Scene.h"
#import "Level3Scene.h"
#import "Level4Scene.h"
#import "Level5Scene.h"
#import "Level6Scene.h"
#import "Level7Scene.h"
#import "Level8Scene.h"
#import "Level9Scene.h"
#import "Level10Scene.h"
#import "Level11Scene.h"
#import "Level12Scene.h"
#import "Level13Scene.h"
#import "Level14Scene.h"
#import "Level15Scene.h"
#import "Level16Scene.h"

// Triangles
#import "TriangleLevel1Scene.h"
#import "TriangleLevel2Scene.h"
#import "TriangleLevel3Scene.h"
#import "TriangleLevel4Scene.h"
#import "TriangleLevel5Scene.h"

// Rotation
#import "RotationLevel1Scene.h"
#import "RotationLevel2Scene.h"
#import "RotationLevel3Scene.h"

@interface GameViewController() <LevelSelectionViewControllerDelegate>

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Add version (build) label
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, skView.bounds.size.height - 22, 100, 18)];
    versionLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    versionLabel.backgroundColor = [UIColor clearColor];
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.text = [NSString stringWithFormat:@"v%@ (%@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    [skView addSubview:versionLabel];
    
    // Create and configure the scene.
    NSIndexPath *levelIndexPath = [NSIndexPath indexPathForRow:0 inSection:LevelSectionTypeTriangles];
    [self _loadLevelAtIndexPath:levelIndexPath toggleState:ToggleStateNew];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)_loadLevelAtIndexPath:(NSIndexPath*)levelIndexPath toggleState:(ToggleState)state
{
    SKView *skView = (SKView *)self.view;
    SKScene *scene = nil;
    NSUInteger level = (state == ToggleStateOld) ? levelIndexPath.row+1 : levelIndexPath.row;
    
    if (state == ToggleStateOld)
    {
        if (levelIndexPath.section == LevelSectionTypeTutorial)
        {
            scene = [TutorialScene new];
        }
        else if (levelIndexPath.section == LevelSectionTypeSquares)
        {
            switch (level) {
                case 1:
                    scene = [Level1Scene new];
                    break;
                    
                case 2:
                    scene = [Level2Scene new];
                    break;
                    
                case 3:
                    scene = [Level3Scene new];
                    break;
                    
                case 4:
                    scene = [Level4Scene new];
                    break;
                    
                case 5:
                    scene = [Level5Scene new];
                    break;
                    
                case 6:
                    scene = [Level6Scene new];
                    break;
                    
                case 7:
                    scene = [Level7Scene new];
                    break;
                    
                case 8:
                    scene = [Level8Scene new];
                    break;
                    
                case 9:
                    scene = [Level9Scene new];
                    break;
                    
                case 10:
                    scene = [Level10Scene new];
                    break;
                    
                case 11:
                    scene = [Level11Scene new];
                    break;
                    
                case 12:
                    scene = [Level12Scene new];
                    break;
                    
                case 13:
                    scene = [Level13Scene new];
                    break;
                    
                case 14:
                    scene = [Level14Scene new];
                    break;
                    
                case 15:
                    scene = [Level15Scene new];
                    break;
                    
                case 16:
                    scene = [Level16Scene new];
                    break;
                    
                default:
                    break;
            }
        }
        else if (levelIndexPath.section == LevelSectionTypeTriangles)
        {
            switch (level) {
                case 1:
                    scene = [TriangleLevel1Scene new];
                    break;
                    
                case 2:
                    scene = [TriangleLevel2Scene new];
                    break;
                    
                case 3:
                    scene = [TriangleLevel3Scene new];
                    break;
                    
                case 4:
                    scene = [TriangleLevel4Scene new];
                    break;
                    
                case 5:
                    scene = [TriangleLevel5Scene new];
                    break;
                    
                default:
                    break;
            }
        }
        else if (levelIndexPath.section == LevelSectionTypeRotation)
        {
            switch (level) {
                case 1:
                    scene = [RotationLevel1Scene new];
                    break;
                    
                case 2:
                    scene = [RotationLevel2Scene new];
                    break;
                    
                case 3:
                    scene = [RotationLevel3Scene new];
                    break;
                    
                default:
                    break;
            }
        }
    }
    else
    {
        switch (level) {
            case 0:
                scene = [V2TutorialScene new];
                break;
                
            case 1:
                scene = [V2Level1Scene new];
                break;
                
            case 2:
                scene = [V2Level2Scene new];
                break;
                
            case 3:
                scene = [V2Level3Scene new];
                break;
                
            case 4:
                scene = [V2Level4Scene new];
                break;
                
            case 5:
                scene = [V2Level5Scene new];
                break;
                
            case 6:
                scene = [V2Level6Scene new];
                break;
                
            case 7:
                scene = [V2Level7Scene new];
                break;
                
            case 8:
                scene = [V2Level8Scene new];
                break;
                
            case 9:
                scene = [V2Level9Scene new];
                break;
                
            case 10:
                scene = [V2Level10Scene new];
                break;
                
            case 11:
                scene = [V2Level11Scene new];
                break;
                
            case 12:
                scene = [V2Level12Scene new];
                break;
                
            case 13:
                scene = [V2Level13Scene new];
                break;
                
            case 14:
                scene = [V2Level14Scene new];
                break;
                
            case 15:
                scene = [V2Level15Scene new];
                break;
                
            case 16:
                scene = [V2Level16Scene new];
                break;
                
            case 17:
                scene = [V2Level17Scene new];
                break;
                
            case 18:
                scene = [V2Level18Scene new];
                break;
                
            case 19:
                scene = [V2Level19Scene new];
                break;
                
            case 20:
                scene = [V2Level20Scene new];
                break;
                
            case 21:
                scene = [V2Level21Scene new];
                break;
                
            case 22:
                scene = [V2Level22Scene new];
                break;
                
            case 23:
                scene = [V2Level23Scene new];
                break;
                
            case 24:
                scene = [V2Level24Scene new];
                break;
                
            case 25:
                scene = [V2Level25Scene new];
                break;
                
            case 26:
                scene = [V2Level26Scene new];
                break;
                
            case 27:
                scene = [V2Level27Scene new];
                break;
                
            case 28:
                scene = [V2Level28Scene new];
                break;
                
            case 29:
                scene = [V2Level29Scene new];
                break;
                
            case 30:
                scene = [V2Level30Scene new];
                break;

            default:
                break;
        }
    }
    
    scene = [scene unarchiveFromFile:NSStringFromClass([scene class])];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

#pragma mark - Shake to select level
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake && self.presentedViewController == nil)
    {
        LevelSelectionViewController *vc = [[LevelSelectionViewController alloc] initWithNibName:nil bundle:nil];
        vc.delegate = self;
        [self presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - LevelSectionViewControllerDelegate methods
- (void)didSelectLevelAtIndexPath:(NSIndexPath *)indexPath toggleState:(ToggleState)state
{
    [self _loadLevelAtIndexPath:indexPath toggleState:state];
}

@end
