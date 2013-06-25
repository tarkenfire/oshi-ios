//
//  KataListViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/25/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface KataListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    DataController* dataController;
}

@end
