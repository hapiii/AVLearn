//
//  VideoRecorderViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/30.
//

#import "VideoRecorderViewController.h"
#import "ELPushStreamViewController.h"

@interface VideoRecorderViewController ()

@end

@implementation VideoRecorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始采集视频" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"利用Camera进行采集";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)play {
    ELPushStreamViewController* viewController = [[ELPushStreamViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}



@end
