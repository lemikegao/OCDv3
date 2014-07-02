//
//  GameViewController.m
//  OCDv3
//
//  Created by Michael Gao on 6/19/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "GameViewController.h"
#import "LevelSelectionViewController.h"
#import "TutorialScene.h"
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

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

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
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, skView.bounds.size.height - 18, 100, 18)];
    versionLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    versionLabel.backgroundColor = [UIColor clearColor];
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.text = [NSString stringWithFormat:@"v%@ (%@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    [skView addSubview:versionLabel];
    
    // Create and configure the scene.
    [self _loadLevel:0];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)_loadLevel:(NSUInteger)level
{
    SKView * skView = (SKView *)self.view;
    SKScene *scene;
    
    switch (level) {
        case 0:
            scene = [TutorialScene unarchiveFromFile:@"TutorialScene"];
            break;
            
        case 1:
            scene = [Level1Scene unarchiveFromFile:@"Level1Scene"];
            break;
            
        case 2:
            scene = [Level2Scene unarchiveFromFile:@"Level2Scene"];
            break;
            
        case 3:
            scene = [Level3Scene unarchiveFromFile:@"Level3Scene"];
            break;
            
        case 4:
            scene = [Level4Scene unarchiveFromFile:@"Level4Scene"];
            break;
            
        case 5:
            scene = [Level5Scene unarchiveFromFile:@"Level5Scene"];
            break;
            
        case 6:
            scene = [Level6Scene unarchiveFromFile:@"Level6Scene"];
            break;
            
        case 7:
            scene = [Level7Scene unarchiveFromFile:@"Level7Scene"];
            break;
            
        case 8:
            scene = [Level8Scene unarchiveFromFile:@"Level8Scene"];
            break;
            
        case 9:
            scene = [Level9Scene unarchiveFromFile:@"Level9Scene"];
            break;
            
        case 10:
            scene = [Level10Scene unarchiveFromFile:@"Level10Scene"];
            break;
            
        case 11:
            scene = [Level11Scene unarchiveFromFile:@"Level11Scene"];
            break;
            
        case 12:
            scene = [Level12Scene unarchiveFromFile:@"Level12Scene"];
            break;
            
        case 13:
            scene = [Level13Scene unarchiveFromFile:@"Level13Scene"];
            break;
            
        case 14:
            scene = [Level14Scene unarchiveFromFile:@"Level14Scene"];
            break;
            
        case 15:
            scene = [Level15Scene unarchiveFromFile:@"Level15Scene"];
            break;
            
        case 16:
            scene = [Level16Scene unarchiveFromFile:@"Level16Scene"];
            break;
            
        default:
            break;
    }
    
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
- (void)didSelectLevel:(NSUInteger)level
{
    [self _loadLevel:level];
}

@end
