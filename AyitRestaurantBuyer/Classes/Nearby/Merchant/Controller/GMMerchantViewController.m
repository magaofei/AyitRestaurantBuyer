//
//  GMMerchantViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#pragma mark - 实现传递订单模型功能
// 从商家页面 选中多款商品, 传递商家和商品模型数组, 到订单页面

#import "GMMerchantViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

#import "GMMerchantHeaderCell.h"
#import "GMMerchantGoodsCell.h"
#import "GMMerchantBottomView.h"
#import "GMSubmitOrderViewController.h"
#import "GMCommodityItem.h"
#import "OrderItem.h"
#import "GMHTTPNetworking.h"
#import "GMMerchantItem.h"
#import <YYModel/YYModel.h>

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GMMerchantViewController ()<UITableViewDelegate, UITableViewDataSource, GMMerchantGoodsCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GMMerchantBottomView *bottomView;

/** 数据 */
@property (nonatomic, strong) NSMutableArray *commodityArray;

@property (nonatomic, strong) NSMutableArray *selectedCommodityArray;

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

- (NSMutableArray *)selectedCommodityArray {
    if (!_selectedCommodityArray) {
        _selectedCommodityArray = [NSMutableArray array];
    }
    return _selectedCommodityArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    
    [self initWithData];
    
    
    
}

- (void)initWithData {
    
    // 拿到商家id POST所有商品
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    
    NSDictionary *p = @{
                        @"merchantId": self.merchantItem.id
                        };
    [manager POST:@"/server/merchant/commodity/getByMerchantId" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (!responseObject) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
            return ;
        }
        if ([responseObject[@"success"] boolValue] != YES) {
            [SVProgressHUD showErrorWithStatus:@"返回错误"];
            return;
        }
        
        // 遍历所有数据
        NSArray *data = responseObject[@"data"];
        GMCommodityItem *item = [[GMCommodityItem alloc] init];
        for (NSDictionary *d in data) {
            item = [GMCommodityItem yy_modelWithJSON:d];
            [self.commodityArray addObject:item];
        }
        
//        NSIndexSet *headSection = [[NSIndexSet alloc] initWithIndex:0];
//        [self.tableView reloadSections:headSection withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    // 获取商家信息
    NSDictionary *merchantP = @{
                                @"id": self.merchantItem.id
                                };
    [manager POST:@"/server/merchant/merchant/findById" parameters:merchantP progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
            return ;
        }
        if ([responseObject[@"success"] boolValue] != YES) {
            [SVProgressHUD showErrorWithStatus:@"返回错误"];
            return;
        }
        NSDictionary *data = responseObject[@"data"];
        GMMerchantItem *item = [GMMerchantItem yy_modelWithJSON:data];
        self.merchantItem = item;
        
        [self.tableView reloadData];
//        NSIndexSet *headSection = [[NSIndexSet alloc] initWithIndex:1];
//        [self.tableView reloadSections:headSection withRowAnimation:UITableViewRowAnimationAutomatic];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
//    // data
//    GMCommodityItem *commodityItem = [[GMCommodityItem alloc] init];
//    commodityItem.commodityName = @"地三鲜";
//    commodityItem.commoditySales = @"月售18份";
//    commodityItem.commodityPrice = @"12";
//    
//    commodityItem.commodityIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495025816791&di=7a78bb12d3eb3efbe94759b11edba3bf&imgtype=0&src=http%3A%2F%2Fi3.dpfile.com%2F2010-11-27%2F5954190_b.jpg";
//    
//    GMCommodityItem *commodityItem2 = [[GMCommodityItem alloc] init];
//    commodityItem2.commodityName = @"红烧茄子";
//    commodityItem2.commoditySales = @"月售13份";
//    commodityItem2.commodityPrice = @"12";
//    
//    commodityItem2.commodityIcon = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495097436963&di=7b85be0dd5b6e320349abb92d9a93169&imgtype=0&src=http%3A%2F%2Fp3.qhimg.com%2Ft01bf1fa855d3d2d7ad.png";
//    
//    [self.commodityArray addObject:commodityItem];
//    [self.commodityArray addObject:commodityItem2];
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
 去支付
 */
- (void)clickSettlementButton {
    
    [self.selectedCommodityArray removeAllObjects];
    // 当前选择的商品
    for (GMCommodityItem *item in _commodityArray) {
        if (item.commodityQuantity > 0) {
            [self.selectedCommodityArray addObject:item];
        }
    }
   
    // 跳转到确认订单
    GMSubmitOrderViewController *submitOrderVC = [[GMSubmitOrderViewController alloc] init];
    
    // 传递模型
    OrderItem *merchantOrderItem = [[OrderItem alloc] init];
    merchantOrderItem.orderTotalPrice = _totalPrice;
    merchantOrderItem.commodityItems = self.selectedCommodityArray;
    merchantOrderItem.merchantItem = self.merchantItem;
    
    submitOrderVC.submitOrderItem = merchantOrderItem;
    
    
    [self.navigationController pushViewController:submitOrderVC animated:YES];
    
}

#pragma mark - dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 90;
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
        
        headerCell.merchantNameLabel.text = self.merchantItem.merchantName;
        
        headerCell.merchantAfficheLabel.text = @"公告:欢迎光临, 用餐高峰时期请提前下单, 谢谢";
        headerCell.couponInfoLabel.text = @"新用户下单立减¥7.0元";
        
        
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
        
        if (self.commodityArray.count <= 0) {
            return goodsCell;
        }
        
        GMCommodityItem *item = self.commodityArray[indexPath.row];
        goodsCell.commodityItem = self.commodityArray[indexPath.row];
        [goodsCell.commodityIconImageView sd_setImageWithURL:[NSURL URLWithString:item.showImg.firstObject] placeholderImage:[UIImage imageNamed:@"maocai"]];
        
        goodsCell.commodityTitleLabel.text = item.commodityName;
        goodsCell.commoditySalesLabel.text = [NSString stringWithFormat:@"月售%ld份", (long)item.countOfSelled];
        goodsCell.commodityPriceLabel.text = [NSString stringWithFormat:@"¥%ld", (long)item.price];
        goodsCell.commodityDetailTitleLabel.text = @"";
        
        
        return goodsCell;
    }
    
    
    
}

#pragma mark - tableView

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

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
    
    // $12 转换为 12
    _totalPrice = cell.commodityItem.price + self.totalPrice;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"总价:¥%zd",_totalPrice];
    
    // 添加当前商品
//    cell.commodityItem.commodityQuantity ++;
    
   
    
    
    
    
}

- (void)commodityCellDidClickReduceButton:(GMMerchantGoodsCell *)cell {
    // 计算总价
    _totalPrice = self.totalPrice - cell.commodityItem.price;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"总价:¥%zd",_totalPrice];
    
//    cell.commodityItem.commodityQuantity --;
    
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
