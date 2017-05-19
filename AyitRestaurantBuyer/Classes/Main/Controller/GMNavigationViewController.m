//
//  GMNavigationViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMNavigationViewController.h"

@interface GMNavigationViewController ()

@end

@implementation GMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed: 2.0/255.0 green: 152.0/255.0 blue: 254.0/255.0 alpha: 1.0]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    
    
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
