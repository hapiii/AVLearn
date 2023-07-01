//
//  AudioToolboxEncoderViewController.m
//  AVLearn
//
//  Created by wq on 2023/7/1.
//

#import "AudioToolboxEncoderViewController.h"
#import "CommonUtil.h"
#import "AudioToolboxEncoder.h"

@interface AudioToolboxEncoderViewController ()<FillDataDelegate>
{
    AudioToolboxEncoder*            _encoder;
    NSString*                       _pcmFilePath;
    NSString*                       _aacFilePath;
    NSFileHandle*                   _aacFileHandle;
    NSFileHandle*                   _pcmFileHandle;
    double                          _startEncodeTimeMills;
}

@end

@implementation AudioToolboxEncoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始encode" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(encode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用AudioToolbox 解码";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)encode {
    NSLog(@"AudioToolbox Encoder Test...");
    _pcmFilePath = [CommonUtil bundlePath:@"problem.pcm"];
    _pcmFileHandle = [NSFileHandle fileHandleForReadingAtPath:_pcmFilePath];
    _aacFilePath = [CommonUtil documentsPath:@"vocal.aac"];
    [[NSFileManager defaultManager] removeItemAtPath:_aacFilePath error:nil];
    [[NSFileManager defaultManager] createFileAtPath:_aacFilePath contents:nil attributes:nil];
    _aacFileHandle = [NSFileHandle fileHandleForWritingAtPath:_aacFilePath];
    NSInteger sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    _startEncodeTimeMills = CFAbsoluteTimeGetCurrent() * 1000;
    _encoder = [[AudioToolboxEncoder alloc] initWithSampleRate:sampleRate channels:channels bitRate:bitRate withADTSHeader:YES filleDataDelegate:self];

}

- (UInt32) fillAudioData:(uint8_t*) sampleBuffer bufferSize:(UInt32) bufferSize;
{
    UInt32 ret = 0;
    NSData* data = [_pcmFileHandle readDataOfLength:bufferSize];
    if(data && data.length > 0) {
        memcpy(sampleBuffer, data.bytes, data.length);
        ret = (UInt32)data.length;
    }
    return ret;
}

- (void) outputAACPakcet:(NSData*) data presentationTimeMills:(int64_t)presentationTimeMills error:(NSError*) error;
{
    if(nil == error) {
        [_aacFileHandle writeData:data];
    } else {
        NSLog(@"Output AAC Packet return Error:%@", error);
    }
}

- (void) onCompletion {
    int wasteTimeMills = CFAbsoluteTimeGetCurrent() * 1000 - _startEncodeTimeMills;
    NSLog(@"Encode AAC Waste TimeMills is %d", wasteTimeMills);
    [_aacFileHandle closeFile];
    _aacFileHandle = NULL;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
