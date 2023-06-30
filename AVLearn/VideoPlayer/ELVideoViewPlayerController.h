//
//  ELVideoViewPlayerController.h
//  video_player
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 xiaokai.zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ELVideoViewPlayerController : BaseViewController

+ (id)viewControllerWithContentPath:(NSString *)path
                       contentFrame:(CGRect)frame
                       parameters: (NSDictionary *)parameters;

@end
