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

@interface GMMyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

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
    
    self.listArr = @[@"联系方式", @"地址", @"退出"];
    
    [self initSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSubviews {
    _myTableView = [[UITableView alloc] init];
    [self.view addSubview:_myTableView];
    //    _infoTableView.backgroundColor = [UIColor blueColor];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    
    [self initLayoutSubviews];

    
    
}

- (void)initLayoutSubviews {
    [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    
    
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转
    if (indexPath.section == 0) {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//        [self.navigationController pushViewController:loginVC animated:YES];
        [self presentViewController:loginNav animated:YES completion:nil];
       
    }
    
    
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
