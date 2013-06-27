//
//  VocabTableCell.h
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VocabTableCell : UITableViewCell

    @property IBOutlet UILabel* indexLabel;
    @property IBOutlet UILabel* kanaLabel;
    @property IBOutlet UILabel* romaLabel;
    @property IBOutlet UILabel* englishLabel;

@end
