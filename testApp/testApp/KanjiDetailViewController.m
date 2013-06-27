//
//  KanjiDetailViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanjiDetailViewController.h"

@interface KanjiDetailViewController ()

@end

@implementation KanjiDetailViewController

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
    dataController = [DataController getInstance];
    NSDictionary* selectedKanji = dataController.kanjiList[dataController.currentIndex];
    
    
    //deal with stroke images first.
    UIImage* strokeImage = [UIImage imageNamed:[selectedKanji valueForKey:@"image_name"]];
    UIImageView* strokeImageContainer = [[UIImageView alloc] init];
    strokeImageContainer.bounds = CGRectMake(0, 0, strokeImage.size.width, strokeImage.size.height);
    strokeImageContainer.frame = CGRectMake(0, 0, strokeImage.size.width, strokeImage.size.height);
    strokeImageContainer.image = strokeImage;
    strokeScrollView.contentSize = CGSizeMake(strokeImage.size.width, strokeScrollView.frame.size.height);
    [strokeScrollView addSubview:strokeImageContainer];
    

    //popular remaining labels.
    localNavBar.topItem.title = [NSString stringWithFormat:@"Details for %@", [selectedKanji valueForKey:@"kanji"]];
    strokeCountView.text = [selectedKanji valueForKey:@"num_strokes"];
    radicalView.text = [selectedKanji valueForKey:@"radical"];
    kanjiDisplay.text = [selectedKanji valueForKey:@"kanji"];
    
    NSMutableString* holder = [[NSMutableString alloc] init];
    
    for (NSString* kun in [selectedKanji valueForKey:@"kun_readings"])
        [holder appendFormat:@"%@ | ", kun];
    if ([holder length] > 0)
        kunView.text = [holder substringToIndex:[holder length] - 2];

    [holder setString:@""];
    
    for (NSString* on in [selectedKanji valueForKey:@"on_readings"])
        [holder appendFormat:@"%@ | ", on];
    if ([holder length] > 0)
        onView.text = [holder substringToIndex:[holder length] - 2];
    
    [holder setString:@""];
    
    for (NSString* meaning in [selectedKanji valueForKey:@"en_meanings"])
        [holder appendFormat:@"%@, ", meaning];
    if ([holder length] > 0)
        meanings.text = [holder substringToIndex:[holder length] - 2];
    
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
