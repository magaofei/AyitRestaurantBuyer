//
//  GMDetailMerchantViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMDetailMerchantViewController.h"
#import "GMCarouselCell.h"
#import "GMPriceTableViewCell.h"
#import "GMInfoTableViewCell.h"

@interface GMDetailMerchantViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *carouselCell = @"carouselCell";
static NSString *priceCell = @"priceCell";
static NSString *infoCell = @"infoCell";

@implementation GMDetailMerchantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商品详情";
//    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. 绘制界面
    [self initSubviews];
    // 2. 接收数据 请求
    
}


/**
 绘制界面
 */
- (void)initSubviews {
    // 轮播图
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.allowsSelection = NO;
    [self.view addSubview: _tableView];
    
    
    // 价格cell
    
    // 信息cell
    
    // 评价cell
}

- (void)initData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        
        return 3;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 130;
        } else {
            return 60;
        }
    } else {
        return 60;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            GMCarouselCell *cell = [tableView dequeueReusableCellWithIdentifier:carouselCell];
            if (!cell) {
                cell = [[GMCarouselCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:carouselCell];
            }
            return cell;
            
            
        } else if (indexPath.row == 1) {
            GMPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:priceCell];
            if (!cell) {
                cell = [[GMPriceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:priceCell];
            }
            cell.priceLabel.text = @"$27.8";
            cell.originPriceLabel.text = @"$42.9";
            return cell;
        } else {
            GMInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCell];
            if (!cell) {
                cell = [[GMInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCell];
            }
            
            
            return cell;
        }
    } else {
        UITableViewCell *cell1 = [[UITableViewCell alloc] init];
        return cell1;
    }
    
    
    
}

//-(void)testCellData:(GMDetailMerchantViewController *)cell {
//    cell.nameLabel.text = @"小马家常菜";
//    
//    
//    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@"http://img.spriteapp.cn/ugc/2016/03/10/092924_69853.jpg"]];
//    cell.phoneLabel.text = @"手机号:19603822432";
//    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
//    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
//    cell.goodsPriceLabel.text = @"$216.50";
//    //    cell.orderStatusLabel.text = @"状态:已接受";
//    
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
