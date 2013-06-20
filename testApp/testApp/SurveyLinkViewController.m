//
//  SurveyLinkViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/13/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "SurveyLinkViewController.h"

@interface SurveyLinkViewController ()

@end

@implementation SurveyLinkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://docs.google.com/forms/d/1S8XYiKkMPXVCC_q8RxYi_YHZmkPjeDImmJcmpXb-51c/viewform"]];
}

@end
