//
//  RegisterViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/10.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "RegisterViewController.h"
#import <Masonry/Masonry.h>
#import "GMHTTPNetworking.h"
#import <SVProgressHUD/SVProgressHUD.h>

// 用户id
// 联系人
// 商家名称
// 商家电话
// 商家地址
@interface RegisterViewController ()

@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIButton *authCodeButton;
@property (nonatomic, strong) UITextField *authCodeTextField;

@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, assign) BOOL *registerResult;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubviews];
    
}

// 子view
- (void)initSubviews {
    
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.placeholder = @"手机号";
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
#pragma makr - todo 校验输入框
    [self.view addSubview:_phoneTextField];
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"密码";
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_passwordTextField];
    
    _authCodeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _authCodeButton.backgroundColor = [UIColor orangeColor];
    _authCodeButton.titleLabel.tintColor = [UIColor blackColor];
//    _authCodeButton.titleLabel.backgroundColor = [UIColor orangeColor];
    [_authCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    
#pragma mark - 限制发送间隔
    [_authCodeButton addTarget:self action:@selector(sendAuthCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_authCodeButton];

    
    _authCodeTextField = [[UITextField alloc] init];
    _authCodeTextField.placeholder = @"验证码";
    _authCodeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_authCodeTextField];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    _registerButton.backgroundColor = [UIColor orangeColor];
    _registerButton.titleLabel.tintColor = [UIColor blackColor];
    _registerButton.titleLabel.backgroundColor = [UIColor orangeColor];
    [_registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:18];
    _registerButton.enabled = NO;
    

    [_registerButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(120);
        make.left.equalTo(self.view.mas_left).offset(92);
        make.right.equalTo(self.view.mas_right).offset(-92);
    }];
    
    
    [_authCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-92);
    }];
    
    [_authCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authCodeButton.mas_bottom).offset(40);
        make.left.equalTo(self.view.mas_left).offset(92);
        make.right.equalTo(self.view.mas_right).offset(-92);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authCodeTextField.mas_bottom).offset(15);
        make.left.equalTo(self.view.mas_left).offset(92);
        make.right.equalTo(self.view.mas_right).offset(-92);
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(70);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}



/**
 发送验证码
 */
- (void)sendAuthCode {
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    NSDictionary *p = @{
                        @"phone": _phoneTextField.text
                        };
    
    [manager POST:@"/server/authority/user/user/checkRegister" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject) {
            return ;
        }
        
        NSDictionary *d = responseObject;
        // 发送成功
        if ([d[@"success"] boolValue] == 1) {
            _registerButton.enabled = YES;
            [SVProgressHUD showSuccessWithStatus:@"验证码发送成功"];
        } else {
            [SVProgressHUD showErrorWithStatus:@"发送失败"];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)registerUser {
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    NSDictionary *p = @{
                        @"phone": _phoneTextField.text,
                        @"password": _passwordTextField.text,
                        @"type": @"0",
                        @"codeValue": _authCodeTextField.text
                        
                        };
    [manager POST:@"/server/authority/user/user/checkVerificationCode4Register" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"success"] boolValue] == 1) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            
            // 保存id
            [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"id"] forKey:@"id"];
            
            
        } else {
            [SVProgressHUD showErrorWithStatus:@"已经注册, 请直接登录"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
