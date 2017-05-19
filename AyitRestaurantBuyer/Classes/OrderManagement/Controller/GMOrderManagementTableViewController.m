//
//  GMOrderManagementTableViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMOrderManagementTableViewController.h"
#import "OrderTableViewCell.h"
#import "OrderItem.h"
#import "GMCommodityItem.h"
#import "GMMerchantItem.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "OrderDetailViewController.h"

#import <MJRefresh/MJRefresh.h>


@interface GMOrderManagementTableViewController () <UISearchBarDelegate,UISearchResultsUpdating>

//@property (nonatomic, strong) UIView *headerView;

//@property (nonatomic, strong) UISearchController *orderSearchController;

//@property (nonatomic, strong) UITableView *infoTableView;


/**
 存储当前所有订单
 */
@property (nonatomic, strong) NSMutableArray *orderItems;

@end

@implementation GMOrderManagementTableViewController

static NSString *cellName = @"orderManagementCell";

//- (UISearchController *)orderSearchController {
//    self.definesPresentationContext = YES;
//    return _orderSearchController;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单管理";
    [self initSubviews];
    
    [self initWithData];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        OrderItem *item = [[OrderItem alloc] init];
        item.merchantItem.logoImg = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494480859592&di=0aa9752d65bb0d0a21922333a5615ac5&imgtype=0&src=http%3A%2F%2Fpic.syd.com.cn%2F0%2F101%2F21%2F05%2F101210514_000000003dc9cb4c.jpg";
        //    cell.phoneLabel.text = @"手机号:19603822432";
        GMCommodityItem *disanxian = [[GMCommodityItem alloc] init];
        disanxian.commodityName = @"地三鲜盖饭";
        disanxian.commodityQuantity = 2;
        [item.commodityItems addObject:disanxian];
        item.createTime = @"2017.04.12 12:30:02";
        item.orderTotalPrice = 21;
        item.orderState = @"状态:等待商家接受";
        
        [self.orderItems addObject:item];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
    
}


- (void)initWithData {
    OrderItem *item = [[OrderItem alloc] init];
    item.merchantItem.logoImg = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494480859592&di=0aa9752d65bb0d0a21922333a5615ac5&imgtype=0&src=http%3A%2F%2Fpic.syd.com.cn%2F0%2F101%2F21%2F05%2F101210514_000000003dc9cb4c.jpg";
    //    cell.phoneLabel.text = @"手机号:19603822432";
    GMCommodityItem *disanxian = [[GMCommodityItem alloc] init];
    disanxian.commodityName = @"地三鲜盖饭";
    disanxian.commodityQuantity = 2;
    [item.commodityItems addObject:disanxian];
    item.createTime = @"2017.04.12 12:30:02";
    item.orderTotalPrice = 21;
    item.orderState = @"状态:等待商家接受";
    

    
    [self.orderItems addObject:item];
}


- (NSMutableArray *)orderItems {
    if (!_orderItems) {
        _orderItems = [NSMutableArray array];
    }
    return _orderItems;
}

/**
 初始化子视图
 */
- (void)initSubviews {
    self.tableView.rowHeight = 100;
//    self.orderSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    self.orderSearchController.searchBar.delegate = self;
//    self.orderSearchController.searchResultsUpdater = self;
//    self.tableView.tableHeaderView = self.orderSearchController.searchBar;
    
    
    
    [self layoutSubviews];
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orderItems.count;
}

#pragma mark - delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[OrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
    }
    
    OrderItem *item = self.orderItems[indexPath.row];
    

    
    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:item.merchantItem.logoImg] placeholderImage:[UIImage imageNamed:@"maocai"]];
    // 遍历订单下的所有商品, 拼接名称
    NSMutableString *commodityName = [NSMutableString string];
    for (GMCommodityItem *commodityItem in item.commodityItems) {
        [commodityName appendFormat:@"%@+", commodityItem.commodityName];
    }
    
    if (commodityName.length > 0) {
        // 去掉最后一个字符
        [commodityName deleteCharactersInRange:NSMakeRange(commodityName.length - 1, 1)];
    }
    
    // 商品标题
    cell.goodsTitleLabel.text = commodityName;
    cell.orderTimeLabel.text = item.createTime;
    cell.goodsPriceLabel.text = [NSString stringWithFormat:@"%ld", (long)item.orderTotalPrice];
    cell.orderStatusLabel.text = item.orderState;
    
//    [self testCellData:cell];
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 取消键盘
    //    [_orderSearchBar endEditing:YES];
    //    NSLog(@"%s", __func__);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选择
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] init];
    OrderItem *orderItem = self.orderItems[indexPath.row];
    orderDetailVC.orderItem = orderItem;
    
    orderDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:orderDetailVC animated:YES];
    
}

-(void)testCellData:(OrderTableViewCell *)cell {
//    cell.nameLabel.text = @"联系人:李俊龙";
    
    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494480859592&di=0aa9752d65bb0d0a21922333a5615ac5&imgtype=0&src=http%3A%2F%2Fpic.syd.com.cn%2F0%2F101%2F21%2F05%2F101210514_000000003dc9cb4c.jpg"]];
//    cell.phoneLabel.text = @"手机号:19603822432";
    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
    cell.goodsPriceLabel.text = @"¥21";
    cell.orderStatusLabel.text = @"状态:商家已接收";
    
    
}


#pragma mark - TODO: 修改tableView的Y值
- (void)layoutSubviews {
    
    
    //    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.view.mas_top).offset(40);
    //        make.height.equalTo(@50);
    //        make.left.right.equalTo(self.view);
    //    }];
    
    //    [_orderSearchBar mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.view.mas_top);
    //        make.bottom.equalTo(_infoTableView.mas_top);
    //        make.left.right.equalTo(self.view);
    //    }];
    //
    //    [_infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        make.top.equalTo(_headerView.mas_bottom).offset(20);
    ////        make.top.equalTo(self.view.mas_top);
    //        make.left.right.equalTo(self.view);
    //        make.bottom.equalTo(self.view.mas_bottom);
    //    }];
    
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
