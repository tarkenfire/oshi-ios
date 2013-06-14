//
//  HiraQuizViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "HiraQuizViewController.h"

@interface HiraQuizViewController ()

@end

@implementation HiraQuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Hiragana Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"quizIcon"];        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataController = [DataController getInstance];
    
    //quiz is hard-coded for sake of prototype. Real app would draw from database.
    kana = @[@"か",@"あ", @"そ", @"や", @"て"];
    correctAnswers = @[@2, @1, @3, @1, @4];
    
    q1Anwsers = @[@"me", @"ka", @"te", @"so"];
    q2Anwsers = @[@"a", @"go", @"ko", @"yo"];
    q3Anwsers = @[@"ka", @"ru", @"so", @"he"];
    q4Anwsers = @[@"ya", @"chi", @"tsu", @"me"];
    q5Anwsers = @[@"wa", @"ro", @"ka", @"te"];
    
    answers = @[q1Anwsers, q2Anwsers, q3Anwsers, q4Anwsers,q5Anwsers];
    
    counter = 0;
    correct = 0;
    incorrect = 0;
    
    [self loadFirstQuestion];
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadFirstQuestion
{
    NSArray* curAnws = answers[counter];
    
    kanaDisplay.text = kana[counter];
    
    [firstButton setTitle:curAnws[0] forState:UIControlStateNormal];
    [secondButton setTitle:curAnws[1] forState:UIControlStateNormal];
    [thirdButton setTitle:curAnws[2] forState:UIControlStateNormal];
    [fourthButton setTitle:curAnws[3] forState:UIControlStateNormal];
}

-(void)loadNextQuestion
{
    counter++;
    if (counter < 5)
    {
        kanaDisplay.text = kana[counter];
        NSArray* curAnws = answers[counter];
        [firstButton setTitle:curAnws[0] forState:UIControlStateNormal];
        [secondButton setTitle:curAnws[1] forState:UIControlStateNormal];
        [thirdButton setTitle:curAnws[2] forState:UIControlStateNormal];
        [fourthButton setTitle:curAnws[3] forState:UIControlStateNormal];
    }
}

-(IBAction)onClick:(id)sender
{
    
    if (counter < 5)
    {
        int sen = [sender tag];

        if (sen == [correctAnswers[counter] intValue])
        {
            correctLabel.text = [NSString stringWithFormat:@"%d", ++correct];
        }
        else
        {
            incorrectLabel.text = [NSString stringWithFormat:@"%d", ++incorrect];
        }
        
        if(counter == 4)
        {
            NSLog(@"Counter is 4");
        }
        else
        {
            [self loadNextQuestion];
        }
    }
    else
    {
        NSLog(@"After final question.");
    }
}

@end
