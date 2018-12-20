//
//  ZYXNetworkingTool.h
//  AppFramework
//
//  Created by LStrong on 2018/12/19.
//  Copyright © 2018年 gxs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,requestType) {
    POST = 0,
    GET
};

typedef void (^FinishedHandler)(__nullable id result,NSString *errorStr);
typedef void (^ReachabilityHandler)(Reachability *reachability, BOOL isReachable);

@interface ZYXNetworkingTool : NSObject

+ (void)requestWithType:(requestType)type urlString:(NSString *)urlString parameters:(NSDictionary *)parameters finishedHander:(FinishedHandler)finishedHander;

+ (void)isAbletoConnectNetwork:(nullable NSString *)host reachabilityHandler:(ReachabilityHandler)ReachabilityHandler;

@end

NS_ASSUME_NONNULL_END
