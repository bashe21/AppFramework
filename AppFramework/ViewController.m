//
//  ViewController.m
//  AppFramework
//
//  Created by LStrong on 2018/12/19.
//  Copyright © 2018年 gxs. All rights reserved.
//

#import "ViewController.h"
#import "ZYXNetworkingTool.h"
#import "UIImage+ZYXImage.h"
#import "MBProgressHUD+ZYXHud.h"
#import <PPNetworkHelper/PPNetworkHelper.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"hello");
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self reachAblity];
}

- (void)reachAblity {
    BOOL isReachable = [PPNetworkHelper isNetwork];
    DLog(@">>>:%d",isReachable);
    
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType status) {
        DLog(@">>>:%lu",(unsigned long)status);
    }];
}

- (void)drawImage {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageWithColor:[UIColor greenColor]];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:imageView];
}

@end
