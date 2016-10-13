//
//  AppDelegate.m
//  TrainJukeBox
//
//  Created by takuya on 20161012.
//  Copyright © 2016年 takuya. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property AVAudioPlayer *player;
@property NSArray *sound_list;
@property NSArray *button_list;
@property (weak) IBOutlet NSView *mainView;

@end

@implementation AppDelegate

void  dump( id p) {
  printf("%s\n",  ([p description]).UTF8String );
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application

/*
  NSButton *newButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 78, 32)];
  [newButton setBezelStyle:NSRoundedBezelStyle];
  [_mainView addSubview:newButton];
*/

  _player=[AVAudioPlayer alloc];
  _sound_list = @[@"fumikiri",
    @"JR西kyoto予告音",
    @"JR西kyoto接近",
    @"JR西環状接近",
    @"JR西環状線予告音",
    @"JR西神戸線予告音",
    @"JR西神戸線接近",
    @"あーん♡",
    @"ちーん",
    @"ゼルダ-謎解き",
    @"ゼルダ：ごまだれ",
    @"ゼルダ：ごまだれー溜めあり",
    @"デデーン！あうと",
    @"ドラえもん-スネ夫が自慢話BGM",
    @"ドラえもん-タイトル効果音",
    @"ドラえもん-秘密道具-効果音",
    @"ドラクエ-ぼうけんのしょはきえてしまいました",
    @"ドラクエ-レベルアップ-効果音",
    @"ファミマ入店音-効果音",
    @"マクド-フライヤー",
    @"マリオ1up 効果音",
    @"京浜東北：接近音１",
    @"京浜東北：接近音２",
    @"大阪市営地下鉄 接近チャイム",
    @"大阪市営地下鉄-上り-接近",
    @"大阪市営地下鉄-下り接近",
    @"山手線：接近",
    @"山陽電鉄-接近",
    @"水洗トイレ",
    @"目覚まし時計",
    @"阪急-梅田京都線発車",
    @"阪急-梅田宝塚線発車",
    @"阪急-梅田神戸線発車",
    @"阪急-電車接近-予告2",
    @"阪急-電車接近案内",
    @"阪急-電車通過案内",
    @"阪神-旧バージョン-接近",
    @"阪神-旧バージョン-発車1",
    @"阪神-旧バージョン-発車2",
    @"阪神-旧バージョン-通過",
    @"～蛍の光～閉店の時間-OgYWssWn7uQ"];

  NSMutableArray *btn_list = [[NSMutableArray alloc] init];
  [ _sound_list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    int w = 180;
    int h = 40;
    int x = ((int)idx%3)*w;
    int y = ((int)idx/3)*h;
    NSButton *btn = [[NSButton alloc] initWithFrame:NSMakeRect(x, y, w, h)];
    btn.title=obj;
    [btn setTarget:self];
    [btn setAction:@selector(play:)];
    [btn setBezelStyle:NSRoundedBezelStyle];
    [_mainView addSubview:btn];
    NSArray *arr = @[ obj, btn ];
    [btn_list addObject:arr];
  }];

};

- (IBAction)play:(id)sender {
  NSBundle *mainBundle = [NSBundle mainBundle];
  NSButton *b = (NSButton *)sender;
  NSString *myFile = [mainBundle pathForResource:b.title ofType:@"m4r"];//@"JR西kyoto接近.m4r"];
  NSURL *url = [NSURL fileURLWithPath:myFile];

  [_player  initWithContentsOfURL:url error:nil];
  [_player play];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}




@end
