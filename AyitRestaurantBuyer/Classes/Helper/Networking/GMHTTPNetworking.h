//
//  GMHTTPNetworking.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/25.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface GMHTTPNetworking :AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
