//
//  OrderItem.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  商品订单Cell

#import <Foundation/Foundation.h>

@interface OrderItem : NSObject


/**
 商品标题
 */
@property (nonatomic, copy) NSString *name;


/**
 商品价格
 */
@property (nonatomic, copy) NSString *price;


/**
 商品图片
 */
@property (nonatomic, copy) NSString *image;







@end
