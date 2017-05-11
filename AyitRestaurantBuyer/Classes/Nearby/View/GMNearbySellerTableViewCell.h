//
//  GMNearbySellerTableViewCell.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMNearbySellerTableViewCell : UITableViewCell

//@property (nonatomic, strong) UILabel *nameLabel;
//
//@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIImageView *merchantIcon;

@property (nonatomic, strong) UILabel *merchantTitleLabel;

//@property (nonatomic, strong) UILabel *orderTimeLabel;
/**
 优惠信息
 */
@property (nonatomic, strong) UILabel *discountLabel;

@property (nonatomic, strong) UILabel *salesLabel;

@property (nonatomic, strong) UILabel *locationInfoLabel;
//@property (nonatomic, strong) UILabel *merchantPriceLabel;
//
//@property (nonatomic, strong) UILabel *orderStatusLabel;

@end
