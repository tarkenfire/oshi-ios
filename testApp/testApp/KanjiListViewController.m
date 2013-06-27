//
//  KanjiListViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanjiListViewController.h"
#import "KanjiCell.h"
#import "KanjiDetailViewController.h"

@interface KanjiListViewController ()

@end

@implementation KanjiListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Common Kanji";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataController = [DataController getInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataController getKanjiCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    KanjiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"KanjiCell" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    NSDictionary* curKanji = dataController.kanjiList[indexPath.row];
    NSArray* meanings = [curKanji valueForKey:@"en_meanings"];
    
    cell.kanjiDisplay.text = [curKanji valueForKey:@"kanji"];
    cell.firstMeaning.text = meanings[0];
    cell.skip_code.text = [NSString stringWithFormat:@"SKIP %@",[curKanji valueForKey:@"SKIP_code"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KanjiDetailViewController* kanjiView = [[KanjiDetailViewController alloc] initWithNibName:@"KanjiDetailViewController" bundle:nil];
    
    dataController.currentIndex = indexPath.row;
    
    [self presentViewController:kanjiView animated:true completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

@end
