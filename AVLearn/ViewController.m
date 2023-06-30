//
//  ViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/28.
//

#import "ViewController.h"
#import "IndexViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pushViewController:IndexViewController.new animated:NO];
}


@end
