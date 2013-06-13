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
    
    //not a good way to do this for a real app, but will suffice for a mockup.
    hiraList = [[NSArray alloc] initWithObjects:@"あ",@"え",@"い",@"お",@"う",@"か",@"け",@"き",@"こ",@"く", nil];
    hiraRomList = [[NSArray alloc] initWithObjects:@"a",@"e",@"i",@"o",@"u",@"ka",@"ke",@"ki",@"ko",@"ku", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table code
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [hiraList count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [hiraList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [hiraRomList objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:[hiraList objectAtIndex:indexPath.row]
                                                      message:[hiraRomList objectAtIndex:indexPath.row]
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
}

@end
