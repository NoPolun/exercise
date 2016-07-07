//
//  RequestNetWork.m
//  exercise
//
//  Created by 哲 on 16/6/1.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "RequestNetWork.h"

@implementation RequestNetWork
+(void)requestWithURL:(NSString *)urlStr type:(NSString *)type requestSetHeadDictionary:(NSDictionary *)headDic requestBodyDictionary:(NSDictionary *)bodyDic showHuDView:(UIView *)view showErrorAlertView:(BOOL)showAlert success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.requestSerializer.timeoutInterval = 15;
    session.requestSerializer.HTTPShouldHandleCookies = YES;
    session.securityPolicy.allowInvalidCertificates = YES;
    [session.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [session.requestSerializer setValue:@"text/html;charset=UTF-8,application/json" forHTTPHeaderField:@"Accept"];
    for (NSString *key in [headDic allKeys]) {
        NSString *value =[headDic objectForKey:key];
        [session.requestSerializer setValue:value forHTTPHeaderField:key];
    }
    
    if ([type isEqualToString:@"GET"]) {
        [session GET:urlStr parameters:bodyDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else if ([type isEqualToString:@"POST"]){
        [session POST:urlStr parameters:bodyDic progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  success(responseObject);
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  failure(error);
              }];
    }
    
}
@end
