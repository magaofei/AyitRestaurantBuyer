//
//  GMMyViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMMyViewController.h"
#import <Masonry/Masonry.h>

@interface GMMyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSArray *listArr;

@end

static NSString *cellName = @"MyCell";
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
    
    self.myTableView.rowHeight = 50;
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}



#pragma mark - delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
    }
    
    
    
    cell.textLabel.text = self.listArr[indexPath.row];
    
    
    
    
    // cell setup
    
    
    return cell;
}

// 取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转
    
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
