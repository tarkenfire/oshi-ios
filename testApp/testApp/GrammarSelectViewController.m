//
//  GrammarSelectViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "GrammarSelectViewController.h"
#import "VerbConjViewController.h"

@interface GrammarSelectViewController ()

@end

@implementation GrammarSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Grammar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.545 green:0.714 blue:0.839 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    VerbConjViewController* verbConjVC = [[VerbConjViewController alloc] initWithNibName:@"VerbConjViewController" bundle:nil];
    
    switch ([sender tag])
    {
        case 0: //verb conjugation
            [self.navigationController pushViewController:verbConjVC animated:true];
            break;
        case 1: //adjective conjugation
            break;
        case 2: //sentences
            break;
    }
}

@end
