//
//  VideoPlayerEnterViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/29.
//

#import "VideoPlayerEnterViewController.h"
#import "CommonUtil.h"
#import "ELVideoViewPlayerController.h"

NSString * const MIN_BUFFERED_DURATION = @"Min Buffered Duration";
NSString * const MAX_BUFFERED_DURATION = @"Max Buffered Duration";


@interface VideoPlayerEnterViewController ()
{
    NSMutableDictionary*            _requestHeader;
}

@end

@implementation VideoPlayerEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Changba Player";
    _requestHeader = [NSMutableDictionary dictionary];
    _requestHeader[MIN_BUFFERED_DURATION] = @(1.0f);
    _requestHeader[MAX_BUFFERED_DURATION] = @(3.0f);
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"forward local player page...");
    
    NSString* videoFilePath = [CommonUtil bundlePath:@"recording.flv"];
//    videoFilePath = @"http://wspull01.live.changbalive.com/easylive/1709828.flv";
    videoFilePath = [CommonUtil bundlePath:@"test.flv"];
    BOOL usingHWCodec = YES;
    ELVideoViewPlayerController *vc = [ELVideoViewPlayerController viewControllerWithContentPath:videoFilePath contentFrame:self.view.bounds parameters:_requestHeader];
    [[self navigationController] pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
