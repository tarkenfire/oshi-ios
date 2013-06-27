//
//  VocabHomeViewController.m
//  testApp
//
//  Created by Michael Mancuso on 6/27/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "VocabHomeViewController.h"
#import "VocabListViewController.h"


@interface VocabHomeViewController ()

@end

@implementation VocabHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Vocab Lists";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataController = [DataController getInstance];
    
    
    UINavigationBar* navBar = [self.navigationController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.545 green:0.839 blue:0.718 alpha:1]];
    
    UINib* cellNib = [UINib nibWithNibName:@"VocabCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(90, 90)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [dataController getVocabListCount];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    UILabel* setLabel = (UILabel* )[cell viewWithTag:2];
    setLabel.text = [NSString stringWithFormat:@"Set %d", indexPath.row + 1];
    
    UILabel* descLabel = (UILabel* )[cell viewWithTag:3];
    descLabel.text = dataController.vocabListNames[indexPath.row];
    
    return cell;
 
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", indexPath.row);
    if (indexPath.row == 0)
    {
        [self animateCellSelection:[self.collectionView cellForItemAtIndexPath:indexPath]];
        VocabListViewController* vocabVC = [[VocabListViewController alloc] initWithNibName:@"VocabListViewController" bundle:nil];
        [self.navigationController pushViewController:vocabVC animated:true];
        dataController.currentIndex = indexPath.row;
    }
    else
    {
        [self animateCellSelection:[self.collectionView cellForItemAtIndexPath:indexPath]];
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Set Not Released"
                                                          message:@"The vocab set you have selected has not yet been released."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
}

-(void)animateCellSelection:(UICollectionViewCell*)collectionCell
{
    [UIView animateWithDuration:.15f
                          delay:0.f
                        options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^
     {
         [UIView setAnimationRepeatCount:4];
         collectionCell.alpha = 0.0f;
     }
                     completion:^(BOOL finished)
     {
         collectionCell.alpha = 1.0f;
     }];
}

@end
