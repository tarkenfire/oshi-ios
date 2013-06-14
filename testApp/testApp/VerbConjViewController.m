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
        [results setText:@""];
        [input setText:@""];
    }
    else //is conjugate button
    {
        [self.view endEditing:YES];
        NSString* testString = input.text;
        if (![testString compare:@"taberu" options:NSCaseInsensitiveSearch])
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
    NSString* result = @"Taberu - To Eat\nPolite Form: Tabemasu\nTe Form: Tabete\nPast Form (ta form): Tabeta\nNegative Form: Tabenai\nCausative Form: Tabesaseru\nPassive Form: Taberareru\nPotential Form: Taberareru\nConditional Form: Taberebe\n Volitional Form: Tabeyou";
    [results setText:result];
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
