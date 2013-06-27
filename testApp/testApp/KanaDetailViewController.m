//
//  KanaDetailViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/19/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanaDetailViewController.h"

@interface KanaDetailViewController ()

@end

@implementation KanaDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataController = [DataController getInstance];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray* items;
    
    switch (dataController.currentMode)
    {
        case HIRAGANA:
            items = dataController.hiraDetailList[dataController.currentIndex];
            localNavBar.topItem.title = [NSString stringWithFormat:@"Details for %@ (%@)", dataController.hiraList[dataController.currentIndex], dataController.hiraRoList[dataController.currentIndex]];
            mainDisplay.text = dataController.hiraList[dataController.currentIndex];
            break;
        case KATAKANA:
            items = dataController.kataDetailList[dataController.currentIndex];
            localNavBar.topItem.title = [NSString stringWithFormat:@"Details for %@ (%@)", dataController.kataList[dataController.currentIndex], dataController.kataRoList[dataController.currentIndex]];
            mainDisplay.text = dataController.kataList[dataController.currentIndex];
            break;
    }
    
    
    stroke.image = [UIImage imageNamed:items[0]];
    
    originKana.text = items[1];
    spellingKana.text = items[2];
    utfEncode.text = items[3];
    shiftJISEncode.text = items[4];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onDonePressed:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
