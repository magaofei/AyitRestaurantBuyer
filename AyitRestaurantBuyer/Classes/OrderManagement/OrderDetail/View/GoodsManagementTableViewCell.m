//
//  GoodsManagementTableViewCell.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/17.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GoodsManagementTableViewCell.h"
#import <Masonry/Masonry.h>
@implementation GoodsManagementTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Subviews
/**
 子View
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // code
        
        [self initSubviews];
    }
    
    
    return self;
}

- (void) initSubviews {
    
    //    // 联系人姓名
    //    _nameLabel = [[UILabel alloc] init];
    //    [self addSubview:_nameLabel];
    //
    //    // 手机号
    //    _phoneLabel = [[UILabel alloc] init];
    //    [self addSubview:_phoneLabel];
    //    // 缩略图
    
    _commodityIconImageView = [[UIImageView alloc] init];
//    _commodityIconImageView.image = nil;
    [self addSubview:_commodityIconImageView];
    
    // 商品名
    _commodityTitleLabel = [[UILabel alloc] init];
    [self addSubview:_commodityTitleLabel];
    
//    // 订单时间
//    _orderTimeLabel = [[UILabel alloc] init];
//    _orderTimeLabel.font = [UIFont systemFontOfSize:12];
//    _orderTimeLabel.textColor = [UIColor darkGrayColor];
//    [self addSubview:_orderTimeLabel];
    
    // 价格
    _commodityPriceLabel = [[UILabel alloc] init];
    _commodityPriceLabel.font = [UIFont boldSystemFontOfSize:16];
    _commodityPriceLabel.textColor = [UIColor colorWithRed: 255.0/255.0 green: 0.0/255.0 blue: 0.0/255.0 alpha: 1.0];
    [self addSubview:_commodityPriceLabel];
    
    // 商品状态
    _commodityStatusLabel = [[UILabel alloc] init];
    _commodityStatusLabel.textColor = [UIColor grayColor];
    [self addSubview:_commodityStatusLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    //    // 联系人姓名
    //    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(10);
    //        make.left.equalTo(self.mas_left).offset(15);
    //    }];
    //
    //    // 手机号
    //    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(10);
    //        // 左边比右边小 就用负数
    //        make.right.equalTo(self.mas_right).offset(-15);
    //    }];
    
    
    // 缩略图
    
    [_commodityIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@80);
        //        make.height.equalTo(@80);
    }];
    
    // 商品名
    [_commodityTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityIconImageView.mas_top);
        make.left.equalTo(_commodityIconImageView.mas_right).offset(10);
    }];
    
    // 商品状态
    [_commodityStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_commodityIconImageView.mas_centerY);
        make.left.equalTo(_commodityTitleLabel.mas_left);
    }];
    
    // 价格
    [_commodityPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_commodityIconImageView.mas_bottom);
        make.left.equalTo(_commodityTitleLabel.mas_left);
    }];
    

    
    //
}


@end
