//
//  ZYXNetworkingTool.m
//  AppFramework
//
//  Created by LStrong on 2018/12/19.
//  Copyright © 2018年 gxs. All rights reserved.
//

#import "ZYXNetworkingTool.h"

@implementation ZYXNetworkingTool

/**
 网络请求

 @param type 请求类型
 @param urlString 请求地址
 @param parameters 请求参数
 @param finishedHander 请求回调
 */
+ (void)requestWithType:(requestType)type urlString:(NSString *)urlString parameters:(NSDictionary *)parameters finishedHander:(FinishedHandler)finishedHander {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    //manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js", @"application/x-javascript", nil];
    if (type == POST) {
        [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (finishedHander) {
                finishedHander(responseObject,@"");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (finishedHander) {
                finishedHander(nil,error.localizedDescription);
            }
        }];
    } else {
        [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (finishedHander) {
                finishedHander(responseObject,@"");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (finishedHander) {
                finishedHander(nil,error.localizedDescription);
            }
        }];
    }
}

+ (void)isAbletoConnectNetwork:(nullable NSString *)host reachabilityHandler:(ReachabilityHandler)reachabilityHandler {
    NSString *testHost = host ? host : @"www.baidu.com";
    Reachability *reach = [Reachability reachabilityWithHostName:testHost];
    
    reach.reachableBlock = ^(Reachability *reachability) {
        if (reachabilityHandler) {
            reachabilityHandler(reachability, YES);
        }
    };
    
    reach.unreachableBlock = ^(Reachability *reachability) {
        if (reachabilityHandler) {
            reachabilityHandler(reachability, NO);
        }
    };
    
    [reach startNotifier];
}
@end
