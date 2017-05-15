//
//  ForgetPasswordViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/10.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "GMHTTPNetworking.h"
#import <Masonry/Masonry.h>

#import <SVProgressHUD/SVProgressHUD.h>
@interface ForgetPasswordViewController ()


/**
 new不能作为首关键字
 */
@property (nonatomic, strong) UITextField *firstPasswordTextField;
@property (nonatomic, strong) UITextField *secondPasswordTextField;

@property (nonatomic, strong) UIButton *verificationCodeButton;

@property (nonatomic, strong) UITextField *verificationCodeTextField;

@property (nonatomic, strong) UIButton *submitPasswordButton;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"忘记密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubviews];
}

- (void)initSubviews {
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneTextField.placeholder = @"请输入手机号";
    _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:_phoneTextField];
    
    _verificationCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_verificationCodeButton];
    [_verificationCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    _verificationCodeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_verificationCodeButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    [_verificationCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_verificationCodeButton addTarget:self action:@selector(sendVerificationCode) forControlEvents:UIControlEventTouchUpInside];
    
    _verificationCodeTextField = [[UITextField alloc] init];
    _verificationCodeTextField.placeholder = @"请输入验证码";
    _verificationCodeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _verificationCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_verificationCodeTextField];
    
    _firstPasswordTextField = [[UITextField alloc] init];
    _firstPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _firstPasswordTextField.placeholder = @"请输入新的密码";
    _firstPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:_firstPasswordTextField];
    
    _secondPasswordTextField = [[UITextField alloc] init];
    _secondPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondPasswordTextField.placeholder = @"请再输入一次";
    _secondPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:_secondPasswordTextField];
    
    _submitPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_submitPasswordButton];
    [_submitPasswordButton setTitle:@"提交新密码" forState:UIControlStateNormal];
    [_submitPasswordButton setBackgroundColor:[UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0]];
    [_submitPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(80);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view).multipliedBy(0.6);
    }];
    
    [_verificationCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom).offset(15);
        make.right.equalTo(_phoneTextField.mas_right);
    }];
    
    [_verificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_verificationCodeButton.mas_bottom).offset(40);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view).multipliedBy(0.6);
    }];
    
    [_firstPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_verificationCodeTextField.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view).multipliedBy(0.6);
    }];
    
    [_secondPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_firstPasswordTextField.mas_bottom).offset(15);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view).multipliedBy(0.6);
    }];
    
    [_submitPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).offset(-150);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view).multipliedBy(0.7);
    }];
}

- (void)sendVerificationCode {
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    NSDictionary *p = @{
                        @"phone": _phoneTextField.text,
                        @"type": @2
                        };
    
    [manager POST:@"common/verificationCode/verificationCode/sendVerificationCode" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject) {
            return ;
        }
        if ([[responseObject valueForKey:@"success"] boolValue] == 1) {
            [SVProgressHUD showSuccessWithStatus:@"发送成功"];
        } else {
            [SVProgressHUD showErrorWithStatus:@"发送失败"];
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
