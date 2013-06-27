//
//  KanjiDetailViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface KanjiDetailViewController : UIViewController
{
    DataController* dataController;
    
    IBOutlet UIScrollView* strokeScrollView;
    IBOutlet UILabel* strokeCountView;
    IBOutlet UILabel* radicalView;
    IBOutlet UILabel* kunView;
    IBOutlet UILabel* onView;
    IBOutlet UILabel* meanings;
    IBOutlet UILabel* kanjiDisplay;
    
    IBOutlet UINavigationBar* localNavBar;
}

-(IBAction)onDonePressed:(id)sender;

@end
