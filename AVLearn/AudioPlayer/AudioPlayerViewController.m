//
//  AudioPlayerViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/28.
//

#import "AudioPlayerViewController.h"
#import "CommonUtil.h"
#import "AudioPlayer.h"

@interface AudioPlayerViewController ()

@end

@implementation AudioPlayerViewController
{
    AudioPlayer*            _audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    

}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始播放" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 200, 150, 40)];
    stopBtn.backgroundColor = [UIColor blueColor];
    [stopBtn setTitle:@"结束播放" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用ffmpeg解码出SInt16格式的数据，并传递给RemoteIO Unit进行播放";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)play {
    NSLog(@"Play Music...");
//    NSString* filePath = [CommonUtil bundlePath:@"131.aac"];
    NSString* filePath = [CommonUtil bundlePath:@"111.aac"];
    _audioPlayer = [[AudioPlayer alloc] initWithFilePath:filePath];
    [_audioPlayer start];
}

- (void)stop {
    NSLog(@"Stop Music...");
    if(_audioPlayer) {
         [_audioPlayer stop];
    }
}

@end
