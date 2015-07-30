//
//  CustomURLCache.h
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 prams writing in th appdelegate to setting cache
 */

@interface CustomURLCache : NSURLCache
+ (CustomURLCache *)standardURLCache;

//TAKE
- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request;

//STORE
- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse
                 forRequest:(NSURLRequest *)request;
@end
