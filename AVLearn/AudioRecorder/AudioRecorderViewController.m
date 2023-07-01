//
//  AudioRecorderViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/30.
//

#import "AudioRecorderViewController.h"
#import "AudioRecorder.h"
#import "CommonUtil.h"

@interface AudioRecorderViewController ()

@end

@implementation AudioRecorderViewController
{
    AudioRecorder*          _recorder;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始录音" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 200, 150, 40)];
    stopBtn.backgroundColor = [UIColor blueColor];
    [stopBtn setTitle:@"结束录音" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用AudioUnit进行采集";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)play {
    NSLog(@"Forward To Recorder Page...");
    NSString* filePath = [CommonUtil documentsPath:@"recorder.caf"];
    _recorder = [[AudioRecorder alloc] initWithPath:filePath];
    [_recorder start];
}

- (void)stop {
    if(_recorder) {
        [_recorder stop];
    }
}

@end
