//
//  HttpRequestTool.h
//  DYNet
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface HttpRequestTool : NSObject

//对非图片类型的请求的封装
+(void)httpTool_PostUrlString:(NSString *)url Parameters:(NSDictionary *)prams success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

//对图片类型的请求的封装
+(void)httpTool_PostUrlString:(NSString *)url Parameters:(NSDictionary *)prams UploadIMG:(NSArray *)imgArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

//检查网络状态
+ (void)checkNetWorkStatus;

//取消连接
+(void)request_cancel;
@end
