//
//  ViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/11/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "CharacterSelectViewController.h"
#import "GrammarSelectViewController.h"
#import "VocabHomeViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Oshieru";
}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.839 green:0.545 blue:0.769 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    CharacterSelectViewController* charSelectView = [[CharacterSelectViewController alloc] initWithNibName:@"CharacterSelectViewController" bundle:nil];
    GrammarSelectViewController* gramSelectView = [[GrammarSelectViewController alloc] initWithNibName:@"GrammarSelectViewController" bundle:nil];
    VocabHomeViewController* vocabHomeView = [[VocabHomeViewController alloc] initWithNibName:@"VocabHomeViewController" bundle:nil];
    
    switch ([sender tag])
    {
        case 0: //characters
            [self.navigationController pushViewController:charSelectView animated:true];
            break;
        case 1: //grammar
            [self.navigationController pushViewController:gramSelectView animated:true];
            break;
        case 2: //vocabulary
            [self.navigationController pushViewController:vocabHomeView animated:true];
            break;
    }
}

@end
