//
//  LoginViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/9.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

/**
 
 登录流程:
 登录之后,保存并返回Id 作为唯一标识再去请求商家ID 等信息 (用户ID和商家ID分离)
 再去跳转其他界面
 
 */




#import "GMTabBarViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
#import "GMHTTPNetworking.h"
#import <Masonry/Masonry.h>

@interface LoginViewController ()

@property (nonatomic, strong) UITextField             *accountTextField;
@property (nonatomic, strong) UITextField             *passwordTextField;
@property (nonatomic, strong) UIButton                *loginButton;
@property (nonatomic, strong) UIImageView             *tipImageView;
@property (nonatomic, strong) UILabel                 *tipLabel;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicatorView;
@property (nonatomic, strong) UILabel                 *accountLabel;
@property (nonatomic, strong) UILabel                 *passwordLabel;
@property (nonatomic, strong) UIImageView             *iconLogoView;
@property (nonatomic, strong) UIView                  *loginInfoView;

@property (nonatomic, strong) UIBarButtonItem         *popButton;

@property (nonatomic, copy)   NSString                *account;
@property (nonatomic, copy)   NSString                *password;

@property (nonatomic, strong) UILabel                 *ayitLabel;


/**
 注册
 
 */
@property (nonatomic, strong) UIButton *registerBtn;


/**
 忘记密码
 */
@property (nonatomic, strong) UIButton *forgetPasswordBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"用户登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置界面
    [self initSubviews];
    
    // 默认
    _accountTextField.text = @"18603822757";
    _passwordTextField.text = @"123456";
}


/**
 子界面
 */
- (void)initSubviews {
    // 帐号  密码 框
    // 登录按钮
    
    [self initWidget];
 
    
    
    
    
    _tipLabel.hidden = YES;
    _tipImageView.hidden = YES;
    //默认隐藏
    [_loadingIndicatorView stopAnimating];
}

- (void)initWidget {
    /**
     登录按钮框
     */
    _loginButton = [[UIButton alloc] init];
    UIImage *buttonBgImage = [[UIImage imageNamed:@"button-green"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateHighlighted];
    [_loginButton setBackgroundImage:buttonBgImage forState:UIControlStateDisabled];
    [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _loginInfoView = [[UIView alloc] init];
    [self.view addSubview:_loginInfoView];
    
    
    
    // logo文字
    _ayitLabel = [[UILabel alloc] init];
    _ayitLabel.text = @"安阳工学院食堂网络点餐客户版";
    _ayitLabel.font = [UIFont systemFontOfSize:19];
    [self.view addSubview:_ayitLabel];
    
    // 帐号Label
    _accountLabel = [[UILabel alloc] init];
    _accountLabel.text = @"帐号:";
    [_loginInfoView addSubview:_accountLabel];
    
    // 密码Label
    _passwordLabel = [[UILabel alloc] init];
    _passwordLabel.text = @"密码:";
    [_loginInfoView addSubview:_passwordLabel];
    
    // 帐号输入
    
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.placeholder = @"请输入帐号";
    _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_loginInfoView addSubview:_accountTextField];
    // 密码输入
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [_loginInfoView addSubview:_passwordTextField];
    
    
    // 提示info
    _tipImageView = [[UIImageView alloc] init];
    _tipImageView.image = [UIImage imageNamed:@"icon-info"];
    [self.view addSubview:_tipImageView];
    
    
    // 提示文字
    _tipLabel = [[UILabel alloc] init];
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    [self.view addSubview:_tipLabel];
    
    
    // Logo
    _iconLogoView = [[UIImageView alloc] init];

    _iconLogoView.image = [UIImage imageNamed:@"ayit-logo"];
    [self.view addSubview:_iconLogoView];
    
    _loadingIndicatorView = [[UIActivityIndicatorView alloc] init];
    [self.view addSubview:_loadingIndicatorView];
    
    // 注册
    _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
//    _registerBtn.titleLabel.text = @"注册";
    [_registerBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_registerBtn];
    
    
    
    // 忘记密码
    _forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    _forgetPasswordBtn.titleLabel.text = @"忘记密码？";
    [_forgetPasswordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_forgetPasswordBtn addTarget:self action:@selector(clickForgetPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_forgetPasswordBtn];
    
    
    // 左上角关闭按钮
//    _popButton = [UIBarButtonItem buttonWithType:UIButtonTypeSystem];
//    [_popButton setTitle:@"关闭" forState:UIControlStateNormal];
//    [_popButton addTarget:self action:@selector(clickPopButton) forControlEvents:UIControlEventTouchUpInside];
    _popButton = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(clickPopButton)];
    
    
    self.navigationItem.leftBarButtonItem = _popButton;
    
    
    
    [self layoutWidget];
}


/**
 返回上个控制器
 */
- (void)clickPopButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 点击注册按钮，跳转注册控制器
 */
- (void)clickRegisterBtn {
    RegisterViewController *regVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:regVC animated:YES];
//    [self.navigationController presentViewController:regVC animated:YES completion:nil];
}


/**
 点击忘记密码按钮，跳转控制器
 */
- (void) clickForgetPasswordBtn {
    ForgetPasswordViewController *forgetVC = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
//    [self.navigationController presentViewController:forgetVC animated:YES completion:nil];
    
    
}

- (void)layoutWidget {
    
    [_ayitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.topMargin.equalTo(self.view).offset(44);
    }];
    
    // Logo
    [_iconLogoView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 高度宽度
        // 中心X
        // 距离顶部35点
        make.width.height.equalTo(@94);
        make.centerX.equalTo(self.view);
        make.topMargin.equalTo(_ayitLabel.mas_bottom).offset(30);
        
    }];
    
    
    
    // 帐号密码View
    [_loginInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconLogoView.mas_bottom).offset(55);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.equalTo(@80);
    }];
    
    // 帐号Label
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginInfoView.mas_left);
        make.top.equalTo(_loginInfoView.mas_top);
//        make.right.equalTo(_accountTextField.mas_left).offset(-10);
    }];
    
    // 帐号TextField
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginInfoView.mas_top);
        make.right.equalTo(_loginInfoView.mas_right).offset(-10);
        make.left.equalTo(_accountLabel.mas_right).offset(20);
//        make.centerY.equalTo(_accountLabel.mas_centerY);
        
    }];
    
    // 密码Label
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginInfoView.mas_left);
        make.bottom.equalTo(_loginInfoView.mas_bottom).offset(-10);
        // 不知为什么这里不加宽度会加长
        make.width.equalTo(@40);
        
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_loginInfoView.mas_bottom);
        make.right.equalTo(_loginInfoView.mas_right).offset(-10);
        make.left.equalTo(_passwordLabel.mas_right).offset(20);
//        make.centerY.equalTo(_passwordLabel.mas_centerY);
    }];
    
   
    
    
    // 密码TextField
    
    // 登录按钮
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(_loginInfoView.mas_bottom).offset(90);
        make.height.equalTo(@36);
//        make.centerX
    }];
    
    // 登录框的菊花圈
    [_loadingIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_loginButton.mas_centerX);
        make.centerY.equalTo(_loginButton.mas_centerY);
    }];
    
    // tipInfo
    [_tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginButton.mas_bottom).offset(40);
        make.left.equalTo(self.view.mas_left).offset(30);
    }];
    
    // tipText
    
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tipImageView.mas_right).offset(5);
        make.centerY.equalTo(_tipImageView.mas_centerY);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.height.equalTo(@30);
        
    }];
    
    
    [_forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.centerY.equalTo(_registerBtn.mas_centerY);
    }];
    
    
    

}

//当登陆按钮被按下
- (void)loginButtonPressed {
    NSLog(@"Login button pressed");
}

#pragma mark - 登录请求
- (BOOL)cancelLogin{
    //用户名admin  密码test
//    /server/authority/user/user/logon
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
    NSDictionary *p = @{
                        @"phone": _accountTextField.text,
                        @"password": _passwordTextField.text
                        
                        };
    
    __block BOOL result = NO;
    
    [manager POST:@"/server/authority/user/user/logon" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            return ;
        }
        if ([responseObject[@"success"] boolValue] == 1) {
            [[NSUserDefaults standardUserDefaults] setValue:@"id" forKey:@"id"];
            result = YES;
            
            //验证成功
            [self showMainTabBarViewController];//跳转
            _tipLabel.hidden = YES;
            _tipImageView.hidden = YES;
            
        } else {
            // 登录失败
            NSString *errorTip = @"";
            if (_accountTextField.text.length == 0) {
                errorTip = @"请输入用户名";
            } else if (_passwordTextField.text.length == 0) {
                errorTip = @"请输入密码";
            } else {
                errorTip = @"用户名或密码输入有误";
            }
            _tipImageView.hidden = NO;
            _tipLabel.hidden = NO;
            [_tipLabel setText:errorTip];
            result = NO;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
//    if ([_accountTextField.text isEqualToString:@"admin"] && [_passwordTextField.text isEqualToString:@"test"]) {
//        //验证成功
//        [self showMainTabBarViewController];//跳转
//        _tipLabel.hidden = YES;
//        _tipImageView.hidden = YES;
//        return YES;  //验证成功
//    } else {
//        NSString *errorTip = @"";
//        if (_accountTextField.text.length == 0) {
//            errorTip = @"请输入用户名";
//        } else if (_passwordTextField.text.length == 0) {
//            errorTip = @"请输入密码";
//        } else {
//            errorTip = @"用户名或密码输入有误";
//        }
//        _tipImageView.hidden = NO;
//        _tipLabel.hidden = NO;
//        [_tipLabel setText:errorTip];
//        
//    }
    
    return result;
    
    
}
- (void)loginButtonAction {
    //关闭键盘
    [self.view endEditing:YES];
    
    //显示
    [_loadingIndicatorView startAnimating];
    [_loginButton setEnabled:NO];
    [_loadingIndicatorView setAlpha:0.5f]; //0.5的透明度
    [UIView animateWithDuration:1.f animations:^{
        [_loadingIndicatorView setAlpha:1.f];  //1透明度
    } completion:^(BOOL finished) {//当动画完成
        [_loadingIndicatorView stopAnimating];  //结束动画
        [_loginButton setEnabled:YES];
        [self cancelLogin]; //当动画完成调用
    }];
    
    
    
    
}



- (void)loginAction {
    if ([self cancelLogin]) {
        
        NSLog(@"登录成功");
    } else {
        [self loginButtonAction];
        
        NSLog(@"登录失败");
    }
}

- (void)showMainTabBarViewController {
    // 创建TabBarViewController 并跳转
    GMTabBarViewController *tabBarVC = [[GMTabBarViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //关闭键盘
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAccount:(NSString *)account {
    _account = _accountTextField.text;
}

- (void)setPassword:(NSString *)password {
    _password = _passwordTextField.text;
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
