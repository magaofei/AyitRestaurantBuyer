//
//  GMMyViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMyViewController.h"
#import <Masonry/Masonry.h>
#import "GMMyHeadTableViewCell.h"
#import "LoginViewController.h"
#import "GMNavigationViewController.h"

#import <SVProgressHUD/SVProgressHUD.h>

@interface GMMyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *infoTableView;

@property (nonatomic, strong) UIButton *exitButton;

@property (nonatomic, strong) NSArray *listArr;

@end

static NSString *cellName = @"MyCell";
static NSString *myHeadCell = @"myHeadCell";
@implementation GMMyViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArr = @[@"联系方式", @"地址"];
    
    [self initSubviews];
    
    [self initWithData];
}


/**
 获取数据
 */
- (void)initWithData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSubviews {
    _infoTableView = [[UITableView alloc] init];
    [self.view addSubview:_infoTableView];
    //    _infoTableView.backgroundColor = [UIColor blueColor];
    _infoTableView.delegate = self;
    _infoTableView.dataSource = self;
    
    
    
    _exitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
    [_exitButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 0.0/255.0 blue: 0.0/255.0 alpha: 1.0]];
    [_exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_exitButton addTarget:self action:@selector(exitAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    [footView addSubview:_exitButton];
    
    [_exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footView.mas_top).offset(5);
        make.centerX.equalTo(footView.mas_centerX);
        make.bottom.equalTo(footView.mas_bottom).offset(-5);
        make.width.equalTo(footView.mas_width).multipliedBy(0.9);
        
    }];
    
    _infoTableView.tableFooterView = footView;
    
    [self initLayoutSubviews];

    
    
}

- (void)initLayoutSubviews {
    [_infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(_headerView.mas_bottom).offset(20);
        make.top.equalTo(self.view.mas_top);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return self.listArr.count;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60;
    } else {
        return 50;
    }
    
    
}



#pragma mark - delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        GMMyHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myHeadCell];
        if (!cell) {
            cell = [[GMMyHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myHeadCell];
            
        }
        
        // 判断有没有登录
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"id"]) {
            cell.nameLabel.text = @"李俊龙";
        } else {
            cell.nameLabel.text = @"登录/注册";
        }
        
        cell.iconView.image = [UIImage imageNamed:@"my"];
        
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            
        }
        cell.textLabel.text = self.listArr[indexPath.row];
        return cell;
    }
    
    
    
    
    
    
    
    
    
    
    // cell setup
    
    
    
}

// 取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    [_infoTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转
    if (indexPath.section == 0) {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//        [self.navigationController pushViewController:loginVC animated:YES];
        [self presentViewController:loginNav animated:YES completion:nil];
       
    }
    
    
}

- (void)exitAction {
    
    /**
     提示框, 提示用户是否退出
     */
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出" message:@"退出将清除登录状态信息" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *backLoginAction = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 清理登录信息
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"id"]) {
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] isEqualToString:@""];
        }
        
        [SVProgressHUD showSuccessWithStatus:@"已退出"];
        
        
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:backLoginAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
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
