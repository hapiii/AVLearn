//
//  MP3EncoderViewController.m
//  AVLearn
//
//  Created by wq on 2023/7/1.
//

#import "MP3EncoderViewController.h"
#import "CommonUtil.h"
#import "mp3_encoder.h"

@interface MP3EncoderViewController ()

@end

@implementation MP3EncoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始encode" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(decode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"使用luma 对aac 编码为mp3";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)decode {
    NSLog(@"Start Encode...");
    Mp3Encoder* encoder = new Mp3Encoder();
    const char* pcmFilePath = [[CommonUtil bundlePath:@"vocal.pcm"] cStringUsingEncoding:NSUTF8StringEncoding];
    const char *mp3FilePath = [[CommonUtil documentsPath:@"vocal.mp3"] cStringUsingEncoding:NSUTF8StringEncoding];
    int sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    encoder->Init(pcmFilePath, mp3FilePath, sampleRate, channels, bitRate);
    encoder->Encode();
    encoder->Destory();
    delete encoder;
    NSLog(@"Encode Success");
}

@end
