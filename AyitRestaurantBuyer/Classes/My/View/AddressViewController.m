//
//  AddressViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  TextView

#import "AddressViewController.h"

#import <Masonry/Masonry.h>


@interface AddressViewController ()

@property (nonatomic, strong) UITextField *addressTextField;

@property (nonatomic, strong) UIButton *submitChangeButton;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"修改地址";
    
    [self initSubviews];
    
    [self loadData];
    
    
    
    
}




/**
 从服务器获取之前地址信息
 */
- (void)loadData {
    
}

- (void)initSubviews {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _addressTextField = [[UITextField alloc] init];
    _addressTextField.borderStyle = UITextBorderStyleRoundedRect;
    _addressTextField.placeholder = self.addressStr;
    [self.view addSubview:_addressTextField];
    
    _submitChangeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_submitChangeButton setTitle:@"确认修改" forState:UIControlStateNormal];
    _submitChangeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_submitChangeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitChangeButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    [_submitChangeButton addTarget:self action:@selector(submitChangeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitChangeButton];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_addressTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    
    [_submitChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addressTextField.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.7);
        
    }];
}

- (void)submitChangeAction {
    self.change(self.addressTextField.text); //写在前面或写在dismiss的Block中都可以

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
