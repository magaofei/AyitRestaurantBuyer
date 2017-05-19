//
//  GMSubmitOrderRemarkCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMSubmitOrderRemarkCell.h"

#import <Masonry/Masonry.h>

@implementation GMSubmitOrderRemarkCell

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
    
    _remarkTextField = [[UITextField alloc] init];
    [self addSubview:_remarkTextField];
    _remarkTextField.placeholder = @"备注";
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_remarkTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.bottom.equalTo(self);
    }];
}

@end
