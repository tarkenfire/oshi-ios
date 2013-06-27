//
//  HiraQuizViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface KanaQuizViewController : UIViewController
{
    DataController* dataController;
    
    int counter;
    int correct;
    int incorrect;
    
    NSArray* correctAnswers;
    NSArray* kana;
    
    NSArray* q1Anwsers;
    NSArray* q2Anwsers;
    NSArray* q3Anwsers;
    NSArray* q4Anwsers;
    NSArray* q5Anwsers;
    
    NSArray* answers;
    
    IBOutlet UIButton* firstButton;
    IBOutlet UIButton* secondButton;
    IBOutlet UIButton* thirdButton;
    IBOutlet UIButton* fourthButton;
    
    IBOutlet UILabel* kanaDisplay;
    IBOutlet UILabel* correctLabel;
    IBOutlet UILabel* incorrectLabel;
}

-(IBAction)onClick:(id)sender;

@end
