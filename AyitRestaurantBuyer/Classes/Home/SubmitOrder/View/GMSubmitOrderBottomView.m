//
//  GMSubmitOrderBottomView.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMSubmitOrderBottomView.h"
#import <Masonry/Masonry.h>

@interface GMSubmitOrderBottomView ()



@end

@implementation GMSubmitOrderBottomView



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
    
    
    _submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_submitButton setTitle:@"提交订单" forState:UIControlStateNormal];
    [_submitButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 171.0/255.0 blue: 10.0/255.0 alpha: 1.0]];
    
    
    
    _submitButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitButton sizeToFit];
    
    [self addSubview:_submitButton];
    
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(@40);
    }];
    
//    [self sizeToFit];
    
    
    
    
}



@end
