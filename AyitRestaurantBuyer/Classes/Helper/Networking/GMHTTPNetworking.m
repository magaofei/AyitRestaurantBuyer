//
//  GMHTTPNetworking.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/25.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMHTTPNetworking.h"

@implementation GMHTTPNetworking

+ (instancetype)sharedManager {
    static GMHTTPNetworking *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://112.74.217.134:8080/"]];
    });
    return manager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 10;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}


@end
