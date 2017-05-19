//
//  OrderDetailHeaderCell.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/5/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "OrderDetailHeaderCell.h"
#import <Masonry/Masonry.h>

@implementation OrderDetailHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    
    return self;
    
}

- (void)initSubviews {
    
    _merchantIconImageView = [[UIImageView alloc] init];
    [self addSubview:_merchantIconImageView];
    
    _orderStatusLabel = [[UILabel alloc] init];
    _orderStatusLabel.font = [UIFont systemFontOfSize:19];
    [self addSubview:_orderStatusLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_merchantIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.height.equalTo(@80);
    }];
    
    [_orderStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(_merchantIconImageView.mas_bottom).offset(10);
    }];
}

@end
