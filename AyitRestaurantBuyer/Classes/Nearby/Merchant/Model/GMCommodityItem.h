//
//  GMCommodityItem.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMCommodityItem : NSObject

@property (nonatomic, copy) NSString *commodityIcon;

@property (nonatomic, copy) NSString *commodityPrice;

@property (nonatomic, copy) NSString *commodityName;

@property (nonatomic, copy) NSString *commoditySales;

@property (nonatomic, assign) NSInteger commodityQuantity;

@end
