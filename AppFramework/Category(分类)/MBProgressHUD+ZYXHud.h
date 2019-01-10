//
//  MBProgressHUD+ZYXHud.h
//  AppFramework
//
//  Created by zyx on 2018/12/20.
//  Copyright © 2018年 gxs. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (ZYXHud)

+ (void)showIndeterminateWith:(nullable UIView *)view;
+ (void)showMessage:(NSString *)message toView:(nullable UIView *)view isOnlyText:(BOOL)isOnlyText;
+ (void)showCustomView:(NSString *)imgStr message:(nullable NSString *)message toView:(nullable UIView *)view;

+ (void)hideHUDForView:(nullable UIView *)view;

@end

NS_ASSUME_NONNULL_END
