//
//  GMMerchantGoodsCell.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  商家商品

#import <UIKit/UIKit.h>
@class GMMerchantGoodsCell, GMCommodityItem;
@protocol GMMerchantGoodsCellDelegate <NSObject>

- (void)commodityCellDidClickAddButton:(GMMerchantGoodsCell *)cell;
- (void)commodityCellDidClickReduceButton:(GMMerchantGoodsCell *)cell;

@end

@interface GMMerchantGoodsCell : UITableViewCell


/**
 模型
 */
@property (nonatomic, strong) GMCommodityItem *commodityItem;


/**
 代理
 */
@property (nonatomic, weak) id<GMMerchantGoodsCellDelegate>delegate;


@property (nonatomic, strong) UIImageView *commodityIconImageView;

@property (nonatomic, strong) UILabel *commodityTitleLabel;

@property (nonatomic, strong) UILabel *commoditySalesLabel;

@property (nonatomic, strong) UILabel *commodityDetailTitleLabel;

@property (nonatomic, strong) UILabel *commodityPriceLabel;


/**
 减
 */
@property (nonatomic, strong) UIButton *reduceButton;


/**
 商品数量
 */
@property (nonatomic, strong) UILabel *commodityQuantityLabel;

@property (nonatomic, assign) NSUInteger commodityQuantityNumber;


/**
 加
 */
@property (nonatomic, strong) UIButton *addButton;






@end
