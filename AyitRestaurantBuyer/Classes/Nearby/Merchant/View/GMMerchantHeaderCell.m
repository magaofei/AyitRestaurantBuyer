//
//  GMMerchantHeaderCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  商家icon 公告信息

#import "GMMerchantHeaderCell.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GMMerchantHeaderCell ()



@end

@implementation GMMerchantHeaderCell

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

- (void)initSubviews {
    
    _iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    
    _merchantNameLabel = [[UILabel alloc] init];
    [self addSubview:_merchantNameLabel];
    
    _couponInfoLabel = [[UILabel alloc] init];
    _couponInfoLabel.font = [UIFont systemFontOfSize:13];
    _couponInfoLabel.textColor = [UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0];
    [self addSubview:_couponInfoLabel];
    
    
    
    _merchantAfficheLabel = [[UILabel alloc] init];
    _merchantAfficheLabel.font = [UIFont systemFontOfSize:13];
    _merchantAfficheLabel.numberOfLines = 2;
    _merchantAfficheLabel.textColor = [UIColor grayColor];
    [self addSubview:_merchantAfficheLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@100);
        
    }];
    
    [_merchantNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImageView.mas_top).offset(5);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [_merchantAfficheLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_iconImageView.mas_centerY);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [_couponInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.top.equalTo(_iconImageView.mas_bottom).offset(-20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    
    
}

@end
