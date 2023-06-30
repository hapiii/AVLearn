//
//  IndexViewController.m
//  AVLearn
//
//  Created by wq on 2023/6/28.
//

#import "IndexViewController.h"

@interface IndexViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tb;
@property (nonatomic, strong) NSMutableArray <NSString *> *routers;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
}

- (void)configUI {
    
    UITableView *tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tb.delegate = self;
    tb.dataSource = self;
    [self.view addSubview:tb];
    self.tb = tb;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    }
    NSString *controllerClass = self.routers[indexPath.row];
    cell.textLabel.text = self.class.routerDic[controllerClass];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.routers.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class className = NSClassFromString(self.routers[indexPath.row]);
    UIViewController *vc = [[className alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSMutableArray<NSString *> *)routers {
    if (!_routers) {
        _routers = @[
            @"AudioPlayerViewController",
            @"AUPlayerViewController",
            @"OpenGLRendererViewController",
            @"VideoPlayerEnterViewController"
            
        ].mutableCopy;
    }
    return _routers;
}

+ (NSDictionary *)routerDic {
    NSDictionary *dic = @{
        @"AudioPlayerViewController" : @"FFmpeg 解码 RemoteIO Unit音频播放",
        @"AUPlayerViewController" : @"AudioFilePlayer Unit RemoteIO Unit 音频播放",
        @"OpenGLRendererViewController" : @"OpenGL 渲染",
        @"VideoPlayerEnterViewController" : @"视频播放器"
    };
    return dic;
}

@end
