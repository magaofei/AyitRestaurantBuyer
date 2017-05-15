//
//  GMMerchantViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMerchantViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

#import "GMMerchantHeaderCell.h"
#import "GMMerchantGoodsCell.h"
#import "GMMerchantBottomView.h"
#import "GMSubmitOrderViewController.h"
#import "GMCommodityItem.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GMMerchantViewController ()<UITableViewDelegate, UITableViewDataSource, GMMerchantGoodsCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GMMerchantBottomView *bottomView;

/** 数据 */
@property (nonatomic, strong) NSMutableArray *commodityArray;

@property (nonatomic, strong) UILabel *totalPriceLabel;

@property (nonatomic, assign) NSUInteger totalPrice;



/**
 减
 */
@property (nonatomic, strong) UIButton *reduceButton;


/**
 商品数量
 */
@property (nonatomic, strong) UILabel *commodityQuantityLabel;

@property (nonatomic, strong) NSString *commodityQuantitySting;


/**
 加
 */
@property (nonatomic, strong) UIButton *addButton;



/**
 结算button
 */
@property (nonatomic, strong) UIButton *settlementButton;

@end

@implementation GMMerchantViewController

- (NSMutableArray *)commodityArray {
    if (!_commodityArray) {
        _commodityArray = [NSMutableArray array];
    }
    return _commodityArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    _merchantItem = [[GMCommodityItem alloc] init];
    _merchantItem.commodityName = @"地三鲜";
    _merchantItem.commoditySales = @"月售18份";
    _merchantItem.commodityPrice = @"12";
    
    _merchantItem.commodityIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg";
    [self.commodityArray addObject:_merchantItem];
    
}

- (void)initSubviews {
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _bottomView = [[GMMerchantBottomView alloc] init];
    _settlementButton = _bottomView.settlementButton;
    _totalPriceLabel = _bottomView.totalPriceLabel;
    [self.view addSubview:_bottomView];
    [_settlementButton addTarget:self action:@selector(clickSettlementButton) forControlEvents:UIControlEventTouchUpInside];
    [self initLayoutSubviews];
}
- (void)initLayoutSubviews {
    
    /**
     底部的View 结算和价格
     */
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@45);
        
    }];
}
/**
 结算
 */
- (void)clickSettlementButton {
    // 跳转到确认订单
    GMSubmitOrderViewController *submitOrderVC = [[GMSubmitOrderViewController alloc] init];
    [self.navigationController pushViewController:submitOrderVC animated:YES];
    
}

#pragma mark - dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 110;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *merchantHeaderCell = @"merchantHeaderCell";
    static NSString *merchantGoodsCell = @"merchantGoodsCell";
    
    
    if (indexPath.section == 0) {
        GMMerchantHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:merchantHeaderCell];
        
        if (!headerCell) {
            headerCell = [[GMMerchantHeaderCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:merchantHeaderCell];
        }
        
        
        [headerCell.iconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg"]];
        
        
        
        return headerCell;
        
    } else {
        GMMerchantGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:merchantGoodsCell];
        if (!goodsCell) {
            goodsCell = [[GMMerchantGoodsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:merchantGoodsCell];
        }
        
//        [goodsCell.commodityIconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494480859592&di=0aa9752d65bb0d0a21922333a5615ac5&imgtype=0&src=http%3A%2F%2Fpic.syd.com.cn%2F0%2F101%2F21%2F05%2F101210514_000000003dc9cb4c.jpg"]];
//        goodsCell.commodityTitleLabel.text = @"地三鲜";
//        goodsCell.commodityDetailTitleLabel.text = @"";
//        goodsCell.commoditySalesLabel.text = @"月售18份";
//        goodsCell.commodityPriceLabel.text = @"12";
        
        goodsCell.delegate = self;
        
        goodsCell.commodityItem = self.commodityArray[indexPath.row];
        
        
        
        // KVO
//        _commodityQuantityLabel = goodsCell.commodityQuantityLabel;
        
        
//        [_commodityQuantitySting addObserver:self forKeyPath:@"integerValue" options:NSKeyValueObservingOptionNew context:nil];
        
//        _addButton = goodsCell.addButton;
//        [_addButton addTarget:self action:@selector(clickAddButton:)forControlEvents:UIControlEventTouchUpInside];
//        
//        _reduceButton = goodsCell.reduceButton;
//        [_reduceButton addTarget:self action:@selector(clickReduceButton:) forControlEvents:UIControlEventTouchUpInside];
//        
        
        
        return goodsCell;
    }
    
    
    
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return self.commodityArray.count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    
//    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
//    NSString *commodityQuantityStr = [numberFormatter stringFromNumber:[change objectForKey:@"new"]];
//    
//    if (commodityQuantityStr.integerValue >= 1) {
//        self.reduceButton.enabled = YES;
//    }
//    
//    self.commodityQuantityLabel.text = commodityQuantityStr;
//}

#pragma mark - delegate
- (void)commodityCellDidClickAddButton:(GMMerchantGoodsCell *)cell {
    // 计算总价
    _totalPrice = cell.commodityItem.commodityPrice.integerValue + self.totalPrice;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"总价:¥%zd",_totalPrice];
    
}

- (void)commodityCellDidClickReduceButton:(GMMerchantGoodsCell *)cell {
    // 计算总价
    _totalPrice = self.totalPrice - cell.commodityItem.commodityPrice.integerValue;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"总价:¥%zd",_totalPrice];
    
}


//- (void)setCommodityItem:(GMCommodityItem *)commodityItem merchantGoodsCell:(GMMerchantGoodsCell *)cell {
//    cell.commodityItem = commodityItem;
//    [cell.commodityIconImageView sd_setImageWithURL:[NSURL URLWithString:commodityItem.commodityIcon]];
//    
//    cell.commodityTitleLabel.text = commodityItem.commodityName;
//    
//    cell.commoditySalesLabel.text = commodityItem.commoditySales;
//    cell.commodityPriceLabel.text = commodityItem.commodityPrice;
//    
//    // 根据count决定countLabel显示的文字
//    self.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",commodityItem.commodityQuantity];
//    // 根据count决定减号按钮是否能点击
//    self.reduceButton.enabled = (commodityItem.commodityQuantity > 0);
//}

/**
 *  加号点击
 */
//- (void)clickAddButton:(GMMerchantGoodsCell *)cell {
//    // 这里传过来的其实是button
//    // 1.修改模型
//    cell.commodityItem.commodityQuantity ++ ;
//    // 2.修改界面
//    cell.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",cell.commodityItem.commodityQuantity];
//    // 3.减号按钮能点击
//    cell.reduceButton.enabled = YES;
//    // 4.发布通知  自己就是通知的发布者，可以把自己传递过去
//    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClickNotification" object:self];
//    
//    //判断代理是否实现了这个方法，再进行调用，当此方法是optopnal时必须判断
//    if ([self respondsToSelector:@selector(commodityCellDidClickAddButton:)]) {
//        [self commodityCellDidClickAddButton:cell];//通知代理调用方法
//    }
//}
//
///**
// *  减号点击
// */
//- (void)clickReduceButton:(GMMerchantGoodsCell *)cell {
//    // 1.修改模型
//    cell.commodityItem.commodityQuantity -- ;
//    // 2.修改界面
//    cell.commodityQuantityLabel.text = [NSString stringWithFormat:@"%zd",cell.commodityItem.commodityQuantity];
//    
//    if (cell.commodityItem.commodityQuantity == 0) {
//        self.reduceButton.enabled = NO;
//    }
//    
//    // 3.发布通知
//    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClickNotification" object:self];
//    [self commodityCellDidClickReduceButton:cell];
//}



/**
 点击添加按钮
 */
//- (void)clickAddButton {
//    
////    _commodityQuantitySting = [NSString stringWithFormat:@"%ld", _commodityQuantitySting.integerValue+1];
//}
//
//- (void)clickReduceButton {
//    NSLog(@"%s", __func__);
//}

//- (void)dealloc {
//    [self removeObserver:self forKeyPath:@"integerValue"];
//}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    self.hidesBottomBarWhenPushed = NO;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
