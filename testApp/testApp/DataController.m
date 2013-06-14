//
//  DataController.m
//  testApp
//
//  Created by Michael Mancuso on 6/13/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import "DataController.h"

@implementation DataController

static DataController* _instance = nil;

+(DataController*)getInstance
{
    if (!_instance)
    {
        _instance = [[self alloc] init];
    }
    
    return _instance;
}

-(void)populateData
{
    self.hiraList = [[NSArray alloc] initWithObjects:@"あ",@"え",@"い",@"お",@"う",@"か",@"け",@"き",@"こ",@"く", nil];
    self.hiraRoList = [[NSArray alloc] initWithObjects:@"a",@"e",@"i",@"o",@"u",@"ka",@"ke",@"ki",@"ko",@"ku", nil];
}

-(int)getHiraCount
{
    return [self.hiraList count];
}

@end
