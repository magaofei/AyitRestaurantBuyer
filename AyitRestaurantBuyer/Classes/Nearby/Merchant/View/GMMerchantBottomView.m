//
//  GMMerchantBottomView.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMerchantBottomView.h"

#import <Masonry/Masonry.h>

@interface GMMerchantBottomView ()





@end

@implementation GMMerchantBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    
    return self;
    
    
}

- (void)initSubviews {
    
    [self setBackgroundColor:[UIColor blackColor]];
    [self setAlpha:0.88];
    
    _totalPrice = 28;
    
    _totalPriceLabel = [[UILabel alloc] init];
    _totalPriceLabel.font = [UIFont systemFontOfSize:19];
    _totalPriceLabel.textColor = [UIColor whiteColor];
//    _priceLabel.backgroundColor = [UIColor blackColor];
//    _priceLabel.backgroundColor = [UIColor colorWithRed: 28.0/255.0 green: 9.0/255.0 blue: 20.0/255.0 alpha: 1.0];
    
    
    _totalPriceLabel.text = [NSString stringWithFormat:@"总价:¥%zd", _totalPrice];
    
    
    [self addSubview:_totalPriceLabel];
    
    _settlementButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_settlementButton setTitle:@"去结算" forState:UIControlStateNormal];
    [_settlementButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    _settlementButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_settlementButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self addSubview:_settlementButton];
    
//    // 设置宽度
//    CGFloat priceWidth = CGRectGetWidth(self.bounds) * 0.6;
//    CGRect priceBounds = _priceLabel.bounds;
//    priceBounds.size.width = priceWidth;
//    _priceLabel.bounds = priceBounds;
//    
//    CGFloat settlementWidth = CGRectGetWidth(self.bounds) * 0.4;
//    CGRect settlementBounds = _settlementButton.bounds;
//    settlementBounds.size.width = settlementWidth;
//    _settlementButton.bounds = settlementBounds;
    
    
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(50);
//        make.top.equalTo(self).offset(5);
//        make.bottom.equalTo(self).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        
        make.width.equalTo(self).multipliedBy(0.7);
    }];
    
    [_settlementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.bottom.right.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.3);
    }];
}

@end
