//
//  GMNearbyViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  {"success":true,"message":"get all merchants success","data":[{"id":"123","userid":null,"contact":null,"merchantName":"测试一下","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false},{"id":"456","userid":null,"contact":null,"merchantName":"你大爷","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false}]}


#import "GMNearbyViewController.h"
#import "GMNearbySellerTableViewCell.h"
#import "GMDetailMerchantViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYModel/YYModel.h>

@interface GMNearbyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *list;

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellName = @"nearbyCell";
@implementation GMNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"附近商家";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self initSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initSubviews {
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 130;
    [self.view addSubview: _tableView];
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
    [self testCellData:cell];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GMDetailMerchantViewController *detailMerchantVC = [[GMDetailMerchantViewController alloc] init];
    // setup
    
    [self.navigationController pushViewController:detailMerchantVC animated:YES];
}

-(void)testCellData:(GMNearbySellerTableViewCell *)cell {
    cell.nameLabel.text = @"小马家常菜";
    
    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@"http://img.spriteapp.cn/ugc/2016/03/10/092924_69853.jpg"]];
    cell.phoneLabel.text = @"手机号:19603822432";
    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
    cell.goodsPriceLabel.text = @"$216.50";
    //    cell.orderStatusLabel.text = @"状态:已接受";
    
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
