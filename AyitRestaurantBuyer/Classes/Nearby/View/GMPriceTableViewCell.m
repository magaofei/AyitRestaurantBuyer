//
//  GMPriceTableViewCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMPriceTableViewCell.h"
#import <Masonry/Masonry.h>

@interface GMPriceTableViewCell ()

@property (nonatomic, strong) UIButton *buyButton;

@end
@implementation GMPriceTableViewCell

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
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_priceLabel];
    
    _originPriceLabel = [[UILabel alloc] init];
    _originPriceLabel.font = [UIFont systemFontOfSize:12];
    _originPriceLabel.textColor = [UIColor grayColor];
    [self addSubview:_originPriceLabel];
    
    _buyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_buyButton setTitle:@"立即抢购" forState:UIControlStateNormal];
    [self addSubview:_buyButton];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    [_originPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel.mas_right).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        
    }];
    
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.bottom.equalTo(self).offset(-10);
        
    }];
}

@end
