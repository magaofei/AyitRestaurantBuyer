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
    
    _afficheLabel = [[UILabel alloc] init];
    [self addSubview:_afficheLabel];
    
    _couponInfoLabel = [[UILabel alloc] init];
    [self addSubview:_couponInfoLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@100);
        
    }];
    
    [_afficheLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_iconImageView.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    
    [_couponInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(_iconImageView.mas_bottom).offset(-20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
}

@end
