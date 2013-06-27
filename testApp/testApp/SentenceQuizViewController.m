//
//  SentenceQuizViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "SentenceQuizViewController.h"

@interface SentenceQuizViewController ()

@end

@implementation SentenceQuizViewController

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
    
    questionSentences = @[@"私 X 大学生です。\n(Watashi X daigakusei desu.)\nI am a college student",
                          @"私 X 大学生です。\n(Watashi X daigakusei desu.)\nI am ALSO a college student",
                          @"机 X 上に本があります。\n(Tsukue X ue ni hon ga arimasu.)\nThere is a book on the desk",
                          @"野菜 X 好きですか。\nYasai X suki desuka?\nDo you like vegetables?",
                          @"日本語 X 話すことは優しいです。\nNihongo X hanasu koto wa yasashii desu.\nSpeaking Japanese is easy."];
    correctAnswers = @[@3, @1, @1, @4, @2];
    
    q1Anwsers = @[@"私 も 大学生です。", @"私 を 大学生です。", @"私 は 大学生です。", @"私 が 大学生です。"];
    q2Anwsers = @[@"私 も 大学生です。", @"私 は 大学生です。", @"私 を 大学生です。", @"私 に 大学生です。"];
    q3Anwsers = @[@"机 の 上に本があります。", @"机 は 上に本があります。", @"机 に 上に本があります。", @"机 を 上に本があります。"];
    q4Anwsers = @[@"野菜 に 好きですか。", @"野菜 わ 好きですか。", @"野菜 は 好きですか。", @"野菜 が 好きですか。"];
    q5Anwsers = @[@"日本語 は 話すことは優しいです。", @"日本語 を 話すことは優しいです。", @"日本語 が 話すことは優しいです。", @"日本語 も 話すことは優しいです。"];
    
    answers = @[q1Anwsers, q2Anwsers, q3Anwsers, q4Anwsers,q5Anwsers];
    [self loadFirstQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadFirstQuestion
{
    NSArray* curAnws = answers[counter];
    
    sentenceDisplay.text = questionSentences[counter];
    
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
        sentenceDisplay.text = questionSentences[counter];
        NSArray* curAnws = answers[counter];
        [firstButton setTitle:curAnws[0] forState:UIControlStateNormal];
        [secondButton setTitle:curAnws[1] forState:UIControlStateNormal];
        [thirdButton setTitle:curAnws[2] forState:UIControlStateNormal];
        [fourthButton setTitle:curAnws[3] forState:UIControlStateNormal];
    }
}

-(IBAction)onClick:(id)sender
{
    if ([sender tag] == 5)
    {
        [self resetQuiz];
        return;
    }
    
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
            [self showEndMessage];
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

-(void)resetQuiz
{
    counter = 0;
    
    correct = 0;
    incorrect = 0;
    
    correctLabel.text = @"0";
    incorrectLabel.text = @"0";
    
    [self animateCorrectAnswer];
    [self animateIncorrectAnswer];
    
    [self loadFirstQuestion];
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

-(void)showEndMessage
{
    NSString* finalMessage = [NSString stringWithFormat:@"You got %d questions correct and %d questions incorrect", correct, incorrect];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Quiz Ended"
                                                      message:finalMessage
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}


@end
