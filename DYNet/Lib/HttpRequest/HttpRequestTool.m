//
//  HttpRequestTool.m
//  DYNet
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "HttpRequestTool.h"
@implementation HttpRequestTool

#pragma mark 对非图片类型的封装
+(void)httpTool_PostUrlString:(NSString *)url Parameters:(NSDictionary *)prams success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [self checkNetWorkStatus];
    
    //setting cache policy
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /*
     Abstract URLString url
              parameters parameter NSDictionary
              success  successful information
              failure  failure information
     */
    
    [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success (responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure (error);
    }];
}

#pragma mark 对图片类型的封装
+(void)httpTool_PostUrlString:(NSString *)url Parameters:(NSDictionary *)prams UploadIMG:(NSArray *)imgArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    
    [self checkNetWorkStatus];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    /*
     Abstract URLString url
     parameters parameter NSDictionary
     success  successful information
     failure  failure information
     */
    
    [manager POST:url parameters:prams constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        /*
         1.对图片进行上传
         2.图片路径由后台控制，是否添加时间
         3.对图片的大小、上传方式是否有限制
         4.NSData，图片类型为UIImage
         */
        //waiting for writing........
        for (int i =0; i<imgArray.count; i++) {
            UIImage * image = [imgArray objectAtIndex:i];
            NSData * imageData = UIImageJPEGRepresentation(image, 1.0f);
            NSString * nameString = @"uploadImage";
            NSString * fileName = [NSString stringWithFormat:@"upload%d",i];
            [formData appendPartWithFileData:imageData name:nameString fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
}

#pragma mark check the NET ect wifi wlan or other

+ (void)checkNetWorkStatus
{
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     *  AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     *  AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     *  AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络Wifi
     */
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            
            NSLog(@"NotReachable ！");
            
            return ;
        }
        else if (status == AFNetworkReachabilityStatusReachableViaWWAN)
        {
            NSLog(@"ReachableViaWWAN");
        }
        else if (status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            NSLog(@"ReachableViaWiFi");
        }
        
    }];
    
}

#pragma mark cancel request

+(void)request_cancel
{
    AFHTTPRequestOperationManager * http = [AFHTTPRequestOperationManager manager];
    [http.operationQueue cancelAllOperations];
}

@end
