//
//  FDKAACEncoderViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/30.
//

#import "FDKAACEncoderViewController.h"
#import "CommonUtil.h"
#import "audio_encoder.h"
#include <stdio.h>

@interface FDKAACEncoderViewController ()

@end

@implementation FDKAACEncoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始encode" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
   
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"libfdk_aac 对pcm进行aac编码";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)play {
    NSLog(@"FDK AAC Encoder Test...");
    NSString* pcmFilePath = [CommonUtil bundlePath:@"vocal.pcm"];
    NSString* aacFilePath = [CommonUtil documentsPath:@"vocal.aac"];
    FDKAACAudioEncoder* encoder = new FDKAACAudioEncoder();
    int bitsPerSample = 16;
    const char * codec_name = [@"libfdk_aac" cStringUsingEncoding:NSUTF8StringEncoding];
    int bitRate = 128* 1024;
    int channels = 2;
    int sampleRate = 44100;
    encoder->init(bitRate, channels, sampleRate, bitsPerSample, [aacFilePath cStringUsingEncoding:NSUTF8StringEncoding], codec_name);
    int bufferSize = 1024 * 256;
    byte* buffer = new byte[bufferSize];
    FILE* pcmFileHandle = fopen([pcmFilePath cStringUsingEncoding:NSUTF8StringEncoding], "rb");
    size_t readBufferSize = 0;
    while((readBufferSize = fread(buffer, 1, bufferSize, pcmFileHandle)) > 0) {
        encoder->encode(buffer, (int)readBufferSize);
    }
    delete[] buffer;
    fclose(pcmFileHandle);
    encoder->destroy();
    delete encoder;
}

@end
