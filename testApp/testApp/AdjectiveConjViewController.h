//
//  AdjectiveConjViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdjectiveConjViewController : UIViewController
{
    IBOutlet UITextField* input;
    IBOutlet UIView* resultView;
}

-(IBAction)onClick:(id)sender;

@end
