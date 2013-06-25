//
//  CharacterSelectViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "CharacterSelectViewController.h"

#import "HiraListViewController.h"
#import "HiraQuizViewController.h"

@interface CharacterSelectViewController ()

@end

@implementation CharacterSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Characters";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.545 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{  
    switch ([sender tag])
    {
        case 0: //hiragana
        {
            hiraTC = [[UITabBarController alloc] init];
            HiraListViewController* hiraList = [[HiraListViewController alloc] initWithNibName:@"HiraListViewController" bundle:nil];
            HiraQuizViewController* hiraQuiz = [[HiraQuizViewController alloc] initWithNibName:@"HiraQuizViewController" bundle:nil];
            [hiraTC.tabBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.545 alpha:1]];
            [hiraTC setTitle:@"Hiragana Study"];
            hiraTC.viewControllers = @[hiraList, hiraQuiz];

            [self.navigationController pushViewController:hiraTC animated:true];
            break;
        }
        case 1: //katakana
        {
            break;
        }
        case 2: //kanji
        {
            break;
        }
    }
}

@end
