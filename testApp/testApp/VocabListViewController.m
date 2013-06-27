//
//  VocabListViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VocabListViewController.h"
#import "VocabTableCell.h"

@interface VocabListViewController ()

@end

@implementation VocabListViewController

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
    currentVocabList = dataController.vocabLists[dataController.currentIndex];
    
    self.title = dataController.vocabListNames[dataController.currentIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataController getVocabCountAtIndex:[dataController currentIndex]];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    VocabTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"VocabTableCell" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    NSDictionary* curVocab = currentVocabList[indexPath.row];
    cell.indexLabel.text = [curVocab valueForKey:@"index"];
    cell.kanaLabel.text = [curVocab valueForKey:@"vocab_kana"];
    cell.romaLabel.text = [curVocab valueForKey:@"vocab_roma"];
    cell.englishLabel.text = [curVocab valueForKey:@"en_meaning"];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


@end
