//
//  GMNearbyViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  {"success":true,"message":"get all merchants success","data":[{"id":"123","userid":null,"contact":null,"merchantName":"测试一下","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false},{"id":"456","userid":null,"contact":null,"merchantName":"你大爷","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false}]}


#import "GMNearbyViewController.h"
#import "GMNearbySellerTableViewCell.h"
#import "GMDetailGoodsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYModel/YYModel.h>

#import "GMHTTPNetworking.h"
#import "GMMerchantItem.h"

#import "GMMerchantViewController.h"

@interface GMNearbyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellName = @"nearbyCell";
static NSString *carouselCell = @"carouselCell";
static NSUInteger carouselViewHeight = 200;
@implementation GMNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"附近商家";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self initSubviews];
    
    [self initTableViewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)initSubviews {
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 100;
    [self.view addSubview: _tableView];
}


#pragma mark - customMethod
- (void)initTableViewData {
//    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://112.74.217.134:8080/server/merchant/merchant/allMerchants" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject) {
            NSLog(@"没有数据");
            return ;
        }
        
        NSLog(@"%@", responseObject[@"success"]);
        NSDictionary *d = responseObject;
        GMMerchantData *item;
        for (NSDictionary *a in d[@"data"]) {
            item = [GMMerchantData yy_modelWithJSON:a];
            [self.items addObject:item];
        }
        
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"加载失败");
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GMNearbySellerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[GMNearbySellerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    // cell code
    GMMerchantData *item = _items[indexPath.row];
    if (!item) {
        return cell;
    }
    
    // cell setup
    
//    cell.nameLabel.text = item.contact;
//    cell.phoneLabel.text = item.phone;
    
    
    
    [self testCellData:cell];
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转到商家详情页
    GMMerchantViewController *merchantVC = [[GMMerchantViewController alloc] init];
    
//    if (_items) {
//        GMMerchantData *item = _items[indexPath.row];
//        merchantVC.merchantItem = item;
//    }
    
    merchantVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:merchantVC animated:YES];
    
    
}

-(void)testCellData:(GMNearbySellerTableViewCell *)cell {
//    cell.nameLabel.text = @"小马家常菜";
//    
//    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@""]];
//    cell.phoneLabel.text = @"手机号:19603822432";
//    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
//    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
//    cell.goodsPriceLabel.text = @"$216.50";
    
    //https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg
    //    cell.orderStatusLabel.text = @"状态:已接受";
    
    [cell.merchantIcon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg"]];
    cell.merchantTitleLabel.text = @"定正成都冒菜";
    cell.salesLabel.text = @"月售17单";
    cell.locationInfoLabel.text = @"1.7km";
    cell.discountLabel.text = @"新用户下单立减7.0";
    
    
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
