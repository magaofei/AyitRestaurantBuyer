//
//  GMMerchantHeaderCell.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMMerchantHeaderCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconImageView;


/**
 公告信息
 */
//@property (nonatomic, strong) UILabel *afficheLabel;

@property (nonatomic, strong) UILabel *couponInfoLabel;

/**
 商家名称
 */
@property (nonatomic, strong) UILabel *merchantNameLabel;


/**
 商家公告
 */
@property (nonatomic, strong) UILabel *merchantAfficheLabel;
@end
