//
//  OrderDetailBottomView.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/5/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "OrderDetailBottomView.h"
#import <Masonry/Masonry.h>

@implementation OrderDetailBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
    
}

- (void)initSubviews {
    
    _cancelOrderButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:_cancelOrderButton];
    [_cancelOrderButton setTitle:@"取消订单" forState:UIControlStateNormal];
    [_cancelOrderButton setBackgroundColor:[UIColor grayColor]];
    [_cancelOrderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _acceptOrderButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:_acceptOrderButton];
    [_acceptOrderButton setTitle:@"接受订单" forState:UIControlStateNormal];
    [_acceptOrderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_acceptOrderButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    
//    _contactMerchantButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self addSubview:_contactMerchantButton];
//    [_contactMerchantButton setTitle:@"联系商家" forState:UIControlStateNormal];
//    [_contactMerchantButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_contactMerchantButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    
    
    
    [self initLayoutSubviews];
    
}

- (void)initLayoutSubviews {
    [_cancelOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(20);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.equalTo(self.mas_width).multipliedBy(0.4);
    }];
    
    [_acceptOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self.mas_right).offset(-20);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.equalTo(self.mas_width).multipliedBy(0.4);
    }];
    
//    [_contactMerchantButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(5);
//        make.centerX.equalTo(self.mas_centerX);
//        make.bottom.equalTo(self.mas_bottom).offset(-5);
//        make.width.equalTo(self.mas_width).multipliedBy(0.9);
//    }];
    
}

@end
