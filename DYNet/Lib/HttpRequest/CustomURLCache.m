//
//  CustomURLCache.m
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "CustomURLCache.h"

static NSString * const CustomURLCacheExpirationKey = @"CustomURLCacheExpiration";
static NSTimeInterval const CustomURLCacheExpirationInterval = 600;

@implementation CustomURLCache
+(CustomURLCache *)standardURLCache {
    static CustomURLCache *_standardURLCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _standardURLCache = [[CustomURLCache alloc]
                             initWithMemoryCapacity:(2 * 1024 * 1024)
                             diskCapacity:(100 * 1024 * 1024)
                             diskPath:nil];
    });
                  
                  return _standardURLCache;
}
                  
#pragma mark - NSURLCache
                  
- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
                      NSCachedURLResponse *cachedResponse = [super cachedResponseForRequest:request];
                      
                      if (cachedResponse) {
                          NSDate* cacheDate = cachedResponse.userInfo[CustomURLCacheExpirationKey];
                          NSDate* cacheExpirationDate = [cacheDate dateByAddingTimeInterval:CustomURLCacheExpirationInterval];
                          if ([cacheExpirationDate compare:[NSDate date]] == NSOrderedAscending) {
                              [self removeCachedResponseForRequest:request];
                              return nil;
                          }
                      }
    
                  
                  return cachedResponse;
}
                  
- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse
                  forRequest:(NSURLRequest *)request
{
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:cachedResponse.userInfo];
        userInfo[CustomURLCacheExpirationKey] = [NSDate date];
        
        NSCachedURLResponse *modifiedCachedResponse = [[NSCachedURLResponse alloc] initWithResponse:cachedResponse.response data:cachedResponse.data userInfo:userInfo storagePolicy:cachedResponse.storagePolicy];
        
        [super storeCachedResponse:modifiedCachedResponse forRequest:request];
}

@end
