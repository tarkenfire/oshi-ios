//
//  CharacterSelectViewController.h
//  testApp
//
//  Created by Michael Mancuso on 6/12/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterSelectViewController : UIViewController
{
    UITabBarController* hiraTC;
    UITabBarController* kataTC;
}

-(IBAction)onClick:(id)sender;

@end
