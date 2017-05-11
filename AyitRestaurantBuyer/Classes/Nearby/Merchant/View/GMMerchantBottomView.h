//
//  GMMerchantBottomView.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMMerchantBottomView : UIView

@property (nonatomic, strong) UILabel *totalPriceLabel;

@property (nonatomic, assign) NSInteger totalPrice;


/**
 结算button
 */
@property (nonatomic, strong) UIButton *settlementButton;
@end
