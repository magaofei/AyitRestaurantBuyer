//
//  GMMerchantGoodsCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMerchantGoodsCell.h"
#import "GMCommodityItem.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface GMMerchantGoodsCell ()

//@property (nonatomic, strong) UIImageView *iconImageView;
//
//
///**
// 销量
// */
//@property (nonatomic, strong) UILabel *salesLabel;
//
///**
// 折扣
// */
//@property (nonatomic, strong) UILabel *discountLabel;
//
//
///**
// 价格
// */
//@property (nonatomic, strong) UILabel *priceLabel;


@end

@implementation GMMerchantGoodsCell

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
    
    _commodityIconImageView = [[UIImageView alloc] init];
    [self addSubview:_commodityIconImageView];
    
    _commodityTitleLabel = [[UILabel alloc] init];
    _commodityTitleLabel.font = [UIFont systemFontOfSize:19];
    [self addSubview:_commodityTitleLabel];
    
    _commodityDetailTitleLabel = [[UILabel alloc] init];
    _commodityDetailTitleLabel.textColor = [UIColor grayColor];
    _commodityDetailTitleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_commodityDetailTitleLabel];
    
    _commoditySalesLabel = [[UILabel alloc] init];
    _commoditySalesLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_commoditySalesLabel];
    
    _commodityPriceLabel = [[UILabel alloc] init];
    _commodityPriceLabel.font = [UIFont systemFontOfSize:18];
    _commodityPriceLabel.textColor = [UIColor redColor];
    [self addSubview:_commodityPriceLabel];
    
    
    _reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reduceButton setImage:[UIImage imageNamed:@"remove-button"] forState:UIControlStateNormal];
    _reduceButton.hidden = YES;
    [_reduceButton addTarget:self action:@selector(clickReduceButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reduceButton];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"add-button"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(clickAddButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
    
    _commodityQuantityLabel = [[UILabel alloc] init];
    [self addSubview:_commodityQuantityLabel];
    _commodityQuantityLabel.font = [UIFont systemFontOfSize:14];
    
    _commodityQuantityLabel.text = @"";
    
    
    
    
    [self initLayoutSubviews];
}






- (void)initLayoutSubviews {
    [_commodityIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(@90);
    }];
    
    [_commodityTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityIconImageView.mas_top);
        make.left.equalTo(_commodityIconImageView.mas_right).offset(15);
    }];
    
    [_commodityDetailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(_commodityIconImageView.mas_right).offset(15);
    }];
    
    [_commoditySalesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityDetailTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(_commodityIconImageView.mas_right).offset(15);
    }];
    
    [_commodityPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commoditySalesLabel.mas_bottom).offset(10);
        make.left.equalTo(_commodityIconImageView.mas_right).offset(15);
    }];
    
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(_commodityPriceLabel.mas_centerY);
    }];
    
    [_commodityQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_addButton.mas_right).offset(-40);
        make.centerY.equalTo(_commodityPriceLabel.mas_centerY);
    }];
    
    [_reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_commodityQuantityLabel.mas_right).offset(-30);
        make.centerY.equalTo(_commodityPriceLabel.mas_centerY);
    }];
}

- (void)setCommodityItem:(GMCommodityItem *)commodityItem {
    _commodityItem = commodityItem;
    [self.commodityIconImageView sd_setImageWithURL:[NSURL URLWithString:commodityItem.commodityIcon]];
    
    self.commodityTitleLabel.text = commodityItem.commodityName;
    
    self.commoditySalesLabel.text = commodityItem.commoditySales;
    self.commodityPriceLabel.text = commodityItem.commodityPrice;
    
    // 根据count决定countLabel显示的文字
    self.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",commodityItem.commodityQuantity];
    // 根据count决定减号按钮是否能点击
//    self.reduceButton.enabled = (commodityItem.commodityQuantity > 0);
}
//
///**
// *  加号点击
// */
- (void)clickAddButton {
    // 1.修改模型
    self.commodityItem.commodityQuantity ++ ;
    // 2.修改界面
    self.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",self.commodityItem.commodityQuantity];
    // 3.减号按钮显示
    self.reduceButton.hidden = NO;
    // 4.发布通知  自己就是通知的发布者，可以把自己传递过去
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClickNotification" object:self];
    
    //判断代理是否实现了这个方法，再进行调用，当此方法是optopnal时必须判断
    if ([self.delegate respondsToSelector:@selector(commodityCellDidClickAddButton:)]) {
        [self.delegate commodityCellDidClickAddButton:self];//通知代理调用方法
    }
}

/**
 *  减号点击
 */
- (void)clickReduceButton {
    // 1.修改模型
    self.commodityItem.commodityQuantity -- ;
    // 2.修改界面
    self.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",self.commodityItem.commodityQuantity];
    
    if (self.commodityItem.commodityQuantity == 0) {
        self.reduceButton.hidden = YES;
    }
    
    // 3.发布通知
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClickNotification" object:self];
    [self.delegate commodityCellDidClickReduceButton:self];
}


@end
