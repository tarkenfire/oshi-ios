//
//  HiraListViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface HiraListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    DataController* dataController;
}

@end
