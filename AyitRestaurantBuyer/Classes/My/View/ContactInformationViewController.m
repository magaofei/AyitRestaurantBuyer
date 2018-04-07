//
//  ContactInformationViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "ContactInformationViewController.h"

#import <Masonry/Masonry.h>

@interface ContactInformationViewController ()

@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) UIButton *submitChangeButton;

@end

@implementation ContactInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initSubviews];
}

- (void)initSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneTextField.placeholder = self.phoneStr;
    [self.view addSubview:_phoneTextField];
    
    _submitChangeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_submitChangeButton setTitle:@"确认修改" forState:UIControlStateNormal];
    _submitChangeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_submitChangeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitChangeButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    
    [self.view addSubview:_submitChangeButton];
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(40);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
    }];
    
    [_submitChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.7);
        
    }];
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
