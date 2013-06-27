//
//  KanjiListViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KanjiListViewController.h"
#import "KanjiCell.h"

@interface KanjiListViewController ()

@end

@implementation KanjiListViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [dataController getKataCount];
    return 4;
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
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //KanaDetailViewController* kanaView = [[KanaDetailViewController alloc] initWithNibName:@"KanaDetailViewController" bundle:nil];
    
    //dataController.currentIndex = indexPath.row;
    
    //[self presentViewController:kanaView animated:true completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

@end
