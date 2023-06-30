//
//  AUPlayerViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/28.
//

#import "AUPlayerViewController.h"
#import "CommonUtil.h"
#import "AUGraphPlayer.h"

@interface AUPlayerViewController ()

@property(nonatomic, assign) BOOL   isAcc;

@end

@implementation AUPlayerViewController
{
    AUGraphPlayer*                  graphPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isAcc = NO;
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
    
    UIButton *switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 150, 40)];
    switchBtn.backgroundColor = [UIColor yellowColor];
    [switchBtn setTitle:@"切换" forState:UIControlStateNormal];
    [switchBtn addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:switchBtn];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用AudioFilePlayer Unit RemoteIO Unit 进行播放";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)play {
    
    NSLog(@"Play Music...");
    if(graphPlayer) {
        [graphPlayer stop];
    }
//    NSString* filePath = [CommonUtil bundlePath:@"MiAmor.mp3"];
    NSString* filePath = [CommonUtil bundlePath:@"0fe2a7e9c51012210eaaa1e2b103b1b1.m4a"];
    graphPlayer = [[AUGraphPlayer alloc] initWithFilePath:filePath];
    [graphPlayer play];
}
- (IBAction)switchAction {
    _isAcc = !_isAcc;
    [graphPlayer setInputSource:_isAcc];
}

- (void)stop {
    NSLog(@"Stop Music...");
    [graphPlayer stop];
}
@end
