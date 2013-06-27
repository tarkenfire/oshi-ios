//
//  VocabListViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface VocabListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    DataController* dataController;
    NSArray* currentVocabList;
}

@end
