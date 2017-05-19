//
//  OrderItem.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  订单Cell的Model

#import "OrderItem.h"

@implementation OrderItem

- (NSMutableArray *)commodityItems {
    if (!_commodityItems) {
        _commodityItems = [NSMutableArray array];
    }
    return _commodityItems;
}



@end
