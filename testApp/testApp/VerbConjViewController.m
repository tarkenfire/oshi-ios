//
//  VerbConjViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/13/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VerbConjViewController.h"


@interface VerbConjViewController ()

@end

@implementation VerbConjViewController

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
    if ([sender tag] == 0) //then is clear button
    {
        [input setText:@""];
        [resultView setHidden:true];
    }
    else //is conjugate button
    {
        [self.view endEditing:YES];
        NSString* testString = input.text;
        if (![testString compare:@"oshieru" options:NSCaseInsensitiveSearch])
        {
            [self displayResults];
        }
        else
        {
            [self showError];
        }
    }
}

-(void)displayResults
{
    //since there is only one "answer" in regards to the prototype, I can just statically add the information for the one verb here.
    [resultView setHidden:false];
}

-(void)showError
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Invalid Entry"
                                                      message:@"Entry is not a valid verb. Please try again."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

@end
