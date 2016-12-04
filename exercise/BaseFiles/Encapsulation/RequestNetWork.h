//
//  RequestNetWork.h
//  exercise
//
//  Created by 哲 on 16/6/1.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface RequestNetWork : NSObject
+(void)requestWithURL:(NSString *)urlStr type:(NSString *)type requestSetHeadDictionary:(NSDictionary *)headDic requestBodyDictionary:(NSDictionary *)bodyDic showHuDView:(UIView *)view showErrorAlertView:(BOOL)showAlert success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure;
@end
