//
//  GMCommodityItem.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMCommodityItem : NSObject

@property (nonatomic, copy) NSString *commodityName;

@property (nonatomic, assign) NSInteger countOfSelled;

@property (nonatomic, strong) NSArray *commodityImgs;

// 1970年以后
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *description;

@property (nonatomic, copy) NSString *discountPrice;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSArray *showImg;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, copy) NSString *typeId;

@property (nonatomic, copy) NSString *merchantId;



/**
 新填字段, 商品数量
 */
@property (nonatomic, assign) NSInteger commodityQuantity;


/*
 commodityImgs = "<null>";
 commodityName = "\U5730\U4e09\U9c9c";
 countOfSelled = 0;
 createTime = 1495103677889;
 description = "\U5730\U4e09\U9c9c\U76d6\U996d";
 discountPrice = "<null>";
 id = 591d78bd791fc02031b0fc70;
 merchantId = 591d72ca791fc02031b0fc6d;
 price = 12;
 showImg = "<null>";
 sort = 0;
 typeId = "<null>";
 */

@end
