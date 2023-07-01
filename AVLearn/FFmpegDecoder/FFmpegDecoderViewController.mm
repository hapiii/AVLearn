//
//  FFmpegDecoderViewController.m
//  AVLearn
//
//  Created by wq on 2023/7/1.
//

#import "FFmpegDecoderViewController.h"
#import "accompany_decoder_controller.h"
#import "CommonUtil.h"

@interface FFmpegDecoderViewController ()

@end

@implementation FFmpegDecoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始dncode" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(decode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用AudioToolbox 解码";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)decode {
    NSLog(@"decode Test...");
    //由于我们在iOS平台编译的ffmpeg 没有打开mp3的decoder开关，但是打开了aac的 所以这里使用aac来做测试
    const char* mp3FilePath = [[CommonUtil bundlePath:@"111.aac"] cStringUsingEncoding:NSUTF8StringEncoding];
    const char *pcmFilePath = [[CommonUtil documentsPath:@"111.pcm"] cStringUsingEncoding:NSUTF8StringEncoding];
    FFMpegAccompanyDecoderController *decoderController = new FFMpegAccompanyDecoderController();
    decoderController->Init(mp3FilePath, pcmFilePath);
    decoderController->Decode();
    decoderController->Destroy();
    delete decoderController;
    NSLog(@"After decode Test...");
}

@end
