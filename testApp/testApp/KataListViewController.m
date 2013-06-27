//
//  KataListViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/25/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "KataListViewController.h"
#import "KanaDetailViewController.h"

@interface KataListViewController ()

@end

@implementation KataListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Katakana List";
        self.tabBarItem.image = [UIImage imageNamed:@"listIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataController = [DataController getInstance];
    dataController.currentMode = KATAKANA; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataController getKataCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [dataController.kataList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [dataController.kataRoList objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KanaDetailViewController* kanaView = [[KanaDetailViewController alloc] initWithNibName:@"KanaDetailViewController" bundle:nil];
    
    dataController.currentIndex = indexPath.row;
    
    [self presentViewController:kanaView animated:true completion:nil];
}


@end
