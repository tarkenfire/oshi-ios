//
//  HiraListViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "HiraListViewController.h"


@interface HiraListViewController ()

@end

@implementation HiraListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Hiragana List";
        self.tabBarItem.image = [UIImage imageNamed:@"listIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataController = [DataController getInstance];
    [dataController populateData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataController getHiraCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [dataController.hiraList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [dataController.hiraRoList objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:[dataController.hiraList objectAtIndex:indexPath.row]
                                                      message:[dataController.hiraRoList objectAtIndex:indexPath.row]
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
}

@end
