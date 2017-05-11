//
//  GMTabBarViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMTabBarViewController.h"
#import "GMNavigationViewController.h"

#import "GMHomeViewController.h"
#import "GMNearbyViewController.h"
#import "GMOrderManagementTableViewController.h"
#import "GMMyViewController.h"

@interface GMTabBarViewController ()

@end

@implementation GMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initAllTabBarController];
}

// 子控制器
- (void)initAllTabBarController {
    // 首页
//    GMHomeViewController *homeVC = [[GMHomeViewController alloc] init];
//    GMNavigationViewController *homeNav = [[GMNavigationViewController alloc]
//                                           initWithRootViewController:homeVC];
//    homeNav.tabBarItem.title = @"首页";
//    homeNav.tabBarItem.image = [UIImage imageNamed:@"home"];
    // 附近
    GMNearbyViewController *nearbyVC = [[GMNearbyViewController alloc] init];
    GMNavigationViewController *nearbyNav = [[GMNavigationViewController alloc]
                                         initWithRootViewController:nearbyVC];
    nearbyNav.tabBarItem.title = @"附近商家";
    nearbyNav.tabBarItem.image = [UIImage imageNamed:@"nearby"];
    
    // 订单管理
    GMOrderManagementTableViewController *orderManagementVC = [[GMOrderManagementTableViewController alloc] init];
    GMNavigationViewController *orderManagementNav = [[GMNavigationViewController alloc]
                                         initWithRootViewController:orderManagementVC];
    orderManagementNav.tabBarItem.title = @"订单";
    orderManagementNav.tabBarItem.image = [UIImage imageNamed:@"orderManagement"];
    
    // 我的
    
    GMMyViewController *myVC = [[GMMyViewController alloc] init];
    GMNavigationViewController *myNav = [[GMNavigationViewController alloc]
                                         initWithRootViewController:myVC];
    myNav.tabBarItem.title = @"我的";
    myNav.tabBarItem.image = [UIImage imageNamed:@"my"];
    
//    [self addChildViewController:homeNav];
    [self addChildViewController:nearbyNav];
    [self addChildViewController:orderManagementNav];
    [self addChildViewController:myNav];
    
    
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
