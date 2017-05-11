//
//  GMNearbySellerTableViewCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMNearbySellerTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation GMNearbySellerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initSubviews];
    }
    
    return self;
    
}


/**
 Cell
 */
- (void)initSubviews {
    
    _merchantIcon = [[UIImageView alloc] init];
    [self addSubview:_merchantIcon];
    
    _merchantTitleLabel = [[UILabel alloc] init];
    _merchantTitleLabel.font = [UIFont systemFontOfSize:19];
    [self addSubview:_merchantTitleLabel];
    
    _salesLabel = [[UILabel alloc] init];
    _salesLabel.font = [UIFont systemFontOfSize:12];
    _salesLabel.textColor = [UIColor grayColor];
    [self addSubview:_salesLabel];
    
    _locationInfoLabel = [[UILabel alloc] init];
    _locationInfoLabel.font = [UIFont systemFontOfSize:12];
    _locationInfoLabel.textColor = [UIColor grayColor];
    [self addSubview:_locationInfoLabel];
    
    _discountLabel = [[UILabel alloc] init];
    _discountLabel.font = [UIFont systemFontOfSize:12];
    _discountLabel.textColor = [UIColor grayColor];
    [self addSubview:_discountLabel];
    
    // 联系人姓名
//    _nameLabel = [[UILabel alloc] init];
//    [self addSubview:_nameLabel];
//    
//    // 手机号
//    _phoneLabel = [[UILabel alloc] init];
//    [self addSubview:_phoneLabel];
//    // 缩略图
//    
//    _goodsIcon = [[UIImageView alloc] init];
//    _goodsIcon.image = nil;
//    [self addSubview:_goodsIcon];
//    
//    // 商品名
//    _goodsTitleLabel = [[UILabel alloc] init];
//    [self addSubview:_goodsTitleLabel];
//    
//    
//    // 订单时间
//    _orderTimeLabel = [[UILabel alloc] init];
//    _orderTimeLabel.font = [UIFont systemFontOfSize:12];
//    _orderTimeLabel.textColor = [UIColor darkGrayColor];
//    [self addSubview:_orderTimeLabel];
//    
//    // 价格
//    _goodsPriceLabel = [[UILabel alloc] init];
//    _goodsPriceLabel.font = [UIFont boldSystemFontOfSize:16];
//    [self addSubview:_goodsPriceLabel];
    
    //    // 订单状态
    //    _orderStatusLabel = [[UILabel alloc] init];
    //    [self addSubview:_orderStatusLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_merchantIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.width.height.equalTo(@80);
    }];
    
    [_merchantTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_merchantIcon.mas_top);
        make.left.equalTo(_merchantIcon.mas_right).offset(10);
        
    }];
    
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_merchantTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(_merchantIcon.mas_right).offset(10);
    }];
    
    [_locationInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_salesLabel.mas_bottom).offset(5);
        make.left.equalTo(_merchantIcon.mas_right).offset(10);
    }];
    
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_locationInfoLabel.mas_bottom).offset(5);
        make.left.equalTo(_merchantIcon.mas_right).offset(10);
    }];
    
//    // 联系人姓名
//    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(10);
//        
//        make.left.equalTo(self.mas_left).offset(15);
//    }];
//    
//    
//    // 手机号
//    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(10);
//        // 左边比右边小 就用负数
//        make.right.equalTo(self.mas_right).offset(-15);
//    }];
//    
//    
//    // 缩略图
//    
//    [_goodsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_nameLabel.mas_bottom).offset(10);
//        make.left.equalTo(self.mas_left).offset(15);
//        make.width.equalTo(@80);
//        make.height.equalTo(@80);
//    }];
//    
//    // 商品名
//    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_goodsIcon.mas_top);
//        make.left.equalTo(_goodsIcon.mas_right).offset(10);
//    }];
//    
//    // 订单时间
//    [_orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_goodsTitleLabel.mas_bottom).offset(5);
//        make.left.equalTo(_goodsTitleLabel.mas_left);
//    }];
//    
//    // 价格
//    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(_goodsIcon.mas_bottom);
//        make.left.equalTo(_goodsTitleLabel.mas_left);
//    }];
    
    //    // 订单状态
    //    [_orderStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.equalTo(_goodsIcon.mas_bottom);
    //        make.right.equalTo(self.mas_right).offset(-15);
    //    }];
    
    //
}

@end
