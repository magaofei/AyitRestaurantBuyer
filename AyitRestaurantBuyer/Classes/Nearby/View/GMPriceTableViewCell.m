//
//  GMPriceTableViewCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMPriceTableViewCell.h"
#import "GMDetailGoodsViewController.h"
#import <Masonry/Masonry.h>

@interface GMPriceTableViewCell ()



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
    [_buyButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    
    
    _buyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_buyButton addTarget:[GMDetailGoodsViewController class] action:@selector(clickBuyGoods) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_buyButton];
    
    [self initLayoutSubviews];
}

//- (void)clickBuyButton {
//    NSLog(@"%s", __func__);
//}

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
