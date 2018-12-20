//
//  MBProgressHUD+ZYXHud.m
//  AppFramework
//
//  Created by zyx on 2018/12/20.
//  Copyright © 2018年 gxs. All rights reserved.
//

#import "MBProgressHUD+ZYXHud.h"

@implementation MBProgressHUD (ZYXHud)

/**
 显示加载图片

 @param view 需要显示信息的视图
 */
+ (void)showIndeterminateToWith:(nullable UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}


/**
 显示加载图片或文字

 @param message 要显示的文字内容
 @param view 显示信息的视图
 @param isOnlyText 是否仅显示文字
 */
+ (void)showMessage:(NSString *)message toView:(nullable UIView *)view isOnlyText:(BOOL)isOnlyText {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    if (isOnlyText) {
        hud.mode = MBProgressHUDModeText;
    }
}


/**
 显示自定义加载视图

 @param imgStr 图片名字
 @param message 文字信息
 @param view 显示信息的视图
 */
+ (void)showCustomView:(NSString *)imgStr message:(nullable NSString *)message toView:(nullable UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:imgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    hud.label.text = message;
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(nullable UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}



@end
