//
//  Defines.h
//  AppFramework
//
//  Created by zyx on 2018/12/19.
//  Copyright © 2018年 gxs. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#pragma mark - 屏幕宽度和高度
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#pragma mark - 设置随机颜色
#define LRRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#pragma mark - 自定义NSLog
#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"[函数名:%s]" "[行号:%d]>>>: " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif  

#pragma mark - AppDelegate
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

#pragma mark - 弱引用/强引用
#define ZYXWeakSelf(type)  __weak typeof(type) weak##type = type;
#define ZYXStrongSelf(type)  __strong typeof(type) type = weak##type;

#pragma mark - 定义圆角和边框
#define ZYXViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define ZYXViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];

#pragma mark - 获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#pragma mark - 判断当前的iPhone设备/系统版本
//判断是否为iPhone
#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])

//判断是否为iPad
#define IS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s/7/7s/8/8s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus/7p/8p
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

// 判断是否为iPhoneX/Xs
#define iPhoneX [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 812.0f

// 判断是否为Xr/Xs Max
#define iPhoneXr [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 896.0f

//获取系统版本
//这个方法不是特别靠谱
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//建议使用这个方法
#define IOS_SYSTEM_STRING [[UIDevice currentDevice] systemVersion]

//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

#endif /* Defines_h */
