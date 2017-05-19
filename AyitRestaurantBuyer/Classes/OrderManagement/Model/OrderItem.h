//
//  OrderItem.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  商品订单Cell

#import <Foundation/Foundation.h>
@class GMCommodityItem, GMMerchantItem;
@interface OrderItem : NSObject


/**
// 商品标题
// */
//@property (nonatomic, copy) NSString *commodityName;

//@property (nonatomic, strong) GMCommodityItem *commodityItem;

@property (nonatomic, strong) NSMutableArray *commodityItems;

@property (nonatomic, strong) NSString *orderState;

/**
 订单总价
 */
@property (nonatomic, assign) NSInteger orderTotalPrice;

/**
 商品折扣
 */
@property (nonatomic, assign) NSInteger discount;


/**
 订单编号
 */
@property (nonatomic, assign) NSString *orderIdentifier;


/**
 商品图片
 */
//@property (nonatomic, copy) NSString *commodityIcon;


/**
 商家图片
 */
//@property (nonatomic, copy) NSString *merchantLogo;

@property (nonatomic, strong) NSString *createTime;


@property (nonatomic, strong) GMMerchantItem *merchantItem;






@end
