//
//  GMMyHeadTableViewCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMyHeadTableViewCell.h"

#import <Masonry/Masonry.h>

@interface GMMyHeadTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *nameLabel;



@end

@implementation GMMyHeadTableViewCell

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
    _iconView = [[UIImageView alloc] init];
    [self addSubview:_iconView];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

@end
