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

-(id)init
{
    self = [super init];
    
    //load json data
    [self populateData];
    
    return self;
}

-(void)populateData
{
    self.hiraList = @[@"あ",@"え",@"い",@"お",@"う",@"か",@"け",@"き",@"こ",@"く"];
    self.hiraRoList = @[@"a",@"e",@"i",@"o",@"u",@"ka",@"ke",@"ki",@"ko",@"ku"];
    
    self.kataList = @[@"ア", @"エ", @"イ", @"オ", @"ウ", @"ラ", @"レ", @"リ", @"ロ", @"ル"];
    self.kataRoList = @[@"a", @"e", @"i", @"o", @"u", @"ra", @"re", @"ri", @"ro", @"ru"];
    
    self.hiraDetailList = @[@[@"hira_a_stroke", @"安", @"朝日のア", @"E38182", @"82A0"], @[@"hira_e_stroke", @"衣", @"英語のエ", @"E38188", @"82A0"], @[@"hira_i_stroke", @"以", @"いろはのイ", @"E38183", @"82A1"], @[@"hira_o_stroke", @"於", @"大阪のオ", @"E38189", @"82A7"], @[@"hira_u_stroke", @"宇", @"上野のウ", @"E38186", @"82A4"], @[@"hira_ka_stroke", @"加", @"為替のカ", @"E3818B", @"82A9"], @[@"hira_ke_stroke", @"計", @"景色のケ", @"E38191", @"82AF"], @[@"hira_ki_stroke", @"幾", @"切手のキ", @"E3818D", @"82AB"], @[@"hira_ko_stroke", @"己", @"子供のコ", @"E38193", @"82B1"],@[@"hira_ku_stroke", @"久", @"クラブのク", @"E3818F", @"82AD"]];
    
    self.currentIndex = 0;
}

-(int)getHiraCount
{
    return [self.hiraList count];
}

-(int)getKataCount
{
    return [self.kataList count];
}

@end
