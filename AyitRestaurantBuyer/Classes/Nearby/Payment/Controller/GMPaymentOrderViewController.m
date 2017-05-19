//
//  GMPaymentOrderViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMPaymentOrderViewController.h"

#import "OrderItem.h"
#import "GMTabBarViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface GMPaymentOrderViewController ()

@end

@implementation GMPaymentOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"在线支付";
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"";
    } else if (section == 1) {
        return @"在线支付方式";
    } else {
        return @"";
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 4;
    } else {
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        

        
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"红烧茄子";
            
            cell.detailTextLabel.text = @"¥12";
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"Alipay-logo-40"];
            cell.textLabel.text = @"支付宝支付";
        } else if (indexPath.row ==1) {
            cell.imageView.image = [UIImage imageNamed:@"wechat-logo-40"];
            cell.textLabel.text = @"微信支付";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
