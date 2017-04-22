//
//  GMNearbySellerTableViewCell.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMNearbySellerTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIImageView *goodsIcon;

@property (nonatomic, strong) UILabel *goodsTitleLabel;

@property (nonatomic, strong) UILabel *orderTimeLabel;

@property (nonatomic, strong) UILabel *goodsPriceLabel;
//
//@property (nonatomic, strong) UILabel *orderStatusLabel;

@end
