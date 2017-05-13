//
//  GMSubmitOrderViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMSubmitOrderViewController.h"
#import "GMSubmitOrderBottomView.h"
#import "GMOrderManagementTableViewController.h"
#import "GMTabBarViewController.h"
#import "GMNavigationViewController.h"

#import <Masonry/Masonry.h>

#import <SVProgressHUD/SVProgressHUD.h>
@interface GMSubmitOrderViewController ()

@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation GMSubmitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"提交订单";
    self.navigationController.navigationBarHidden = NO;
    // 商品价格
    
    // 商品数量
    
    GMSubmitOrderBottomView *bottomView = [[GMSubmitOrderBottomView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    
    _submitButton = bottomView.submitButton;
    [_submitButton addTarget:self action:@selector(clickSubmitButton) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = bottomView;
    
    
    
}

- (void)clickSubmitButton {
    
    // 提示提交成功
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    
#pragma mark - 在线支付页面
    
    // 跳转到订单页面
    
    GMTabBarViewController *tabBar = [[GMTabBarViewController alloc] init];
    tabBar.selectedIndex = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
    });
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *submitOrderCell = @"SubmitOrderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:submitOrderCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:submitOrderCell];
        
        
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"地三鲜盖饭";
                cell.detailTextLabel.text = @"12";
                break;
            case 1:
                cell.textLabel.text = @"数量";
                cell.detailTextLabel.text = @"2";
                
                break;
            case 2:
                cell.textLabel.text = @"总计";
                cell.detailTextLabel.text = @"¥24";
                break;
            default:
                break;
        }
    
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"优惠券";
                cell.detailTextLabel.text = @"¥-3";
                break;
            case 1:
                cell.textLabel.text = @"订单总价";
                cell.detailTextLabel.text = @"¥21";
                break;
            default:
                break;
        }
    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"您绑定的手机号码";
                
                break;
            case 1:
                cell.textLabel.text = @"18603822757";
                break;
            default:
                break;
        }
    }
    }
    
    if (_loginStatus) {
        
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
