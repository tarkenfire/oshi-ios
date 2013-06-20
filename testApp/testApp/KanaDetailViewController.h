//
//  KanaDetailViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/19/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface KanaDetailViewController : UIViewController
{
    IBOutlet UILabel* mainDisplay;
    IBOutlet UIImageView* stroke;
    IBOutlet UILabel* originKana;
    IBOutlet UILabel* spellingKana;
    IBOutlet UILabel* utfEncode;
    IBOutlet UILabel* shiftJISEncode;

    IBOutlet UINavigationBar* localNavBar;
    
    DataController* dataController;
}



-(IBAction)onDonePressed:(id)sender;

@end
