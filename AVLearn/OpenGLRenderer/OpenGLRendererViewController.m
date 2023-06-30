//
//  OpenGLRendererViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/28.
//

#import "OpenGLRendererViewController.h"
#import "PngPreviewController.h"
#import "CommonUtil.h"

@interface OpenGLRendererViewController ()

@end

@implementation OpenGLRendererViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300, 200)];
    lab.text = @"点击展示";
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString* pngFilePath = [CommonUtil bundlePath:@"1.png"];
    PngPreviewController *vc = [PngPreviewController viewControllerWithContentPath:pngFilePath contentFrame:self.view.bounds];
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
