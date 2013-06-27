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
    self.currentMode = HIRAGANA;
    
    self.hiraList = @[@"あ",@"え",@"い",@"お",@"う",@"か",@"け",@"き",@"こ",@"く"];
    self.hiraRoList = @[@"a",@"e",@"i",@"o",@"u",@"ka",@"ke",@"ki",@"ko",@"ku"];
    
    self.kataList = @[@"ア", @"エ", @"イ", @"オ", @"ウ", @"サ", @"セ", @"シ", @"ソ", @"ス"];
    self.kataRoList = @[@"a", @"e", @"i", @"o", @"u", @"sa", @"se", @"shi", @"so", @"su"];
    
    self.hiraDetailList = @[@[@"hira_a_stroke", @"安", @"朝日のア", @"－－・－－", @"Asahi no \"a\""], @[@"hira_e_stroke", @"衣", @"英語のエ", @"－・－－－", @"Eigo no \"e\""], @[@"hira_i_stroke", @"以", @"いろはのイ", @"･－", @"Iroha no \"i\""], @[@"hira_o_stroke", @"於", @"大阪のオ", @"・－・・・", @"Ōsaka no \"o\""], @[@"hira_u_stroke", @"宇", @"上野のウ", @"・・－", @"Ueno no \"u\""], @[@"hira_ka_stroke", @"加", @"為替のカ", @"・－・・", @"Kawase no \"ka\""], @[@"hira_ke_stroke", @"計", @"景色のケ", @"－・－－", @"Keshiki no \"ke\""], @[@"hira_ki_stroke", @"幾", @"切手のキ", @"－・－・・", @"Kitte no \"ki\""], @[@"hira_ko_stroke", @"己", @"子供のコ", @"－－－－", @"Kodomo no \"ko\""],@[@"hira_ku_stroke", @"久", @"クラブのク", @"・・・－", @"Kurabu no \"ku\""]];
    
    self.kataDetailList = @[@[@"kata_a_stroke", @"阿", @"朝日のア", @"－－・－－", @"Asahi no \"a\""], @[@"kata_e_stroke", @"江", @"英語のエ", @"－・－－－", @"Eigo no \"e\""], @[@"kata_i_stroke", @"伊", @"いろはのイ", @"･－", @"Iroha no \"i\""], @[@"kata_o_stroke", @"於", @"大阪のオ", @"・－・・・", @"Ōsaka no \"o\""], @[@"kata_u_stroke", @"宇", @"上野のウ", @"・・－", @"Ueno no \"u\""], @[@"kata_sa_stroke", @"散", @"桜のサ", @"－・－・－", @"Sakura no \"sa\""], @[@"kata_se_stroke", @"世", @"世界のセ", @"・－－－・", @"Sekai no \"se\""], @[@"kata_shi_stroke", @"之", @"新聞のシ", @"－－・－・", @"Shinbun no \"shi\""], @[@"kata_so_stroke", @"曽", @"そろばんのソ", @"－－－・", @"Soroban no \"so\""],@[@"kata_su_stroke", @"須", @"すずめのス", @"－－－・－", @"Suzume no \"su\""]];

    
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
