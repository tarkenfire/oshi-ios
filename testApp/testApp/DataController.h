//
//  DataController.h
//  testApp
//
//  Created by Michael Mancuso on 6/13/13.
//  Copyright (c) 2013 Hinode Softworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject

typedef enum
{
    KATAKANA = 0, HIRAGANA = 1
}
KanaMode;

@property NSArray* hiraList;
@property NSArray* hiraRoList;

@property NSArray* kataList;
@property NSArray* kataRoList;

@property NSArray* hiraDetailList;
@property NSArray* kataDetailList;

@property NSArray* kanjiList;

@property NSArray* vocabListNames;
@property NSArray* vocabLists;

@property int currentIndex;
@property int currentMode;

+(DataController*)getInstance;
-(void)populateData;
-(int)getHiraCount;
-(int)getKataCount;
-(int)getKanjiCount;
-(int)getVocabListCount;

-(int)getVocabCountAtIndex:(int)selectedIndex;


@end
