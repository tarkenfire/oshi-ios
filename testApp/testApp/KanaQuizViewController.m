//
//  HiraQuizViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanaQuizViewController.h"
#import "SurveyLinkViewController.h"

@interface KanaQuizViewController ()

@end

@implementation KanaQuizViewController

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
    
    switch (dataController.currentMode)
    {
        case HIRAGANA:
            kana = @[@"き",@"ふ", @"こ", @"う", @"ろ"];
            correctAnswers = @[@1, @3, @2, @4, @1];
            
            q1Anwsers = @[@"ki", @"ha", @"te", @"so"];
            q2Anwsers = @[@"a", @"go", @"fu", @"shi"];
            q3Anwsers = @[@"ka", @"ko", @"so", @"he"];
            q4Anwsers = @[@"ya", @"chi", @"tsu", @"u"];
            q5Anwsers = @[@"ro", @"kyu", @"ka", @"te"];
            
            break;
        case KATAKANA:
            kana = @[@"ブ",@"コ", @"タ", @"カ", @"ル"];
            correctAnswers = @[@1, @3, @2, @4, @1];
            
            q1Anwsers = @[@"bu", @"ha", @"te", @"so"];
            q2Anwsers = @[@"a", @"go", @"ko", @"shi"];
            q3Anwsers = @[@"ka", @"ta", @"so", @"he"];
            q4Anwsers = @[@"ya", @"chi", @"tsu", @"wo"];
            q5Anwsers = @[@"re", @"kyu", @"wa", @"te"];
            break;
    }

    //quiz is hard-coded for sake of prototype. Real app would draw from database.
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
            [self animateCorrectAnswer];
        }
        else
        {
            incorrectLabel.text = [NSString stringWithFormat:@"%d", ++incorrect];
            [self animateIncorrectAnswer];
        }
        
        if(counter == 4)
        {
            SurveyLinkViewController* svc = [[SurveyLinkViewController alloc] initWithNibName:@"SurveyLinkViewController" bundle:nil];
            [self presentViewController:svc animated:true completion:nil];
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


-(void)animateCorrectAnswer
{
    [UIView animateWithDuration:.15f
                          delay:0.f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^
                        {
                            [UIView setAnimationRepeatCount:4];
                            correctLabel.alpha = 0.0f;
                        }
                     completion:^(BOOL finished)
                        {
                            correctLabel.alpha = 1.0f;
                        }];
}

-(void)animateIncorrectAnswer
{
    [UIView animateWithDuration:.15f
                          delay:0.f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^
                        {
                            [UIView setAnimationRepeatCount:4];
                            incorrectLabel.alpha = 0.0f;
                        }
                     completion:^(BOOL finished)
                        {
                            incorrectLabel.alpha = 1.0f;
                        }];
}

@end
