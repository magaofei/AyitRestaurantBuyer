//
//  GMDetailMerchantViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMDetailGoodsViewController.h"
#import "GMCarouselCell.h"
#import "GMPriceTableViewCell.h"
#import "GMInfoTableViewCell.h"
#import "GMHTTPNetworking.h"
#import "GMSubmitOrderViewController.h"

@interface GMDetailGoodsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIButton *buyButton;

@property (nonatomic, copy) NSString *ID;

@end

static NSString *carouselCell = @"carouselCell";
static NSString *priceCell = @"priceCell";
static NSString *infoCell = @"infoCell";

@implementation GMDetailGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"商品详情";
//    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. 绘制界面
    [self initSubviews];
    
    [self initNav];
    // 2. 接收数据 请求
    
}

- (void)initNav {
    self.navigationController.navigationBarHidden = YES;
    
    
    
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
    

    // 返回按钮
//    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_backButton setImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal];
    [_backButton sizeToFit];
    [_backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    [self.view addSubview:_backButton];
    _backButton.center = CGPointMake(35, 40);
    
    
    
    // 价格cell
    
    // 信息cell
    
    // 评价cell
#pragma mark - 购买按钮, 然后发送通知到购物车
    
}

- (void)initTableViewData {
    
}


/**
 立即抢购
 */
- (void)clickBuyGoods {
    // 提交订单页面, 传递模型
    
    GMSubmitOrderViewController *submitOrderVC = [[GMSubmitOrderViewController alloc] init];
    
    // 判断是否登录, 没有登录, 用快捷登录, 已经登录, 直接购买
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"id"]) {
        _ID = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        submitOrderVC.loginStatus = YES;
    } else {
        submitOrderVC.loginStatus = NO;
    }
    
    
    
    [self.navigationController pushViewController:submitOrderVC animated:YES];
    
    // 传递模型给购物车
    
    
    
}


/**
 点击返回按钮
 */
- (void)clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
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
            
            _buyButton = cell.buyButton;
            [_buyButton addTarget:self action:@selector(clickBuyGoods) forControlEvents:UIControlEventTouchUpInside];
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
