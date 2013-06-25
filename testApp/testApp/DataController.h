//
//  DataController.h
//  testApp
//
//  Created by Michael Mancuso on 6/13/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject

@property NSArray* hiraList;
@property NSArray* hiraRoList;

@property NSArray* kataList;
@property NSArray* kataRoList;

@property NSArray* hiraDetailList;

@property int currentIndex;

+(DataController*)getInstance;
-(void)populateData;
-(int)getHiraCount;
-(int)getKataCount;


@end
