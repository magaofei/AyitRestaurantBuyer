//
//  GMSubmitOrderViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMSubmitOrderViewController.h"
#import "GMSubmitOrderBottomView.h"
#import "GMOrderManagementTableViewController.h"
#import "GMTabBarViewController.h"
#import "GMNavigationViewController.h"
#import "GMPaymentOrderViewController.h"
#import "OrderItem.h"
#import "GMMerchantItem.h"
#import "GMCommodityItem.h"
#import "GMClientItem.h"
#import "GMSubmitOrderRemarkCell.h"
#import "GMSubmitOrderItem.h"

#import "GMHTTPNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import <Masonry/Masonry.h>
#import <YYModel/YYModel.h>

#import <SVProgressHUD/SVProgressHUD.h>
@interface GMSubmitOrderViewController ()

@property (nonatomic, strong) UIButton *submitButton;

@property (nonatomic, strong) NSArray *infoArray;

@property (nonatomic, strong) NSMutableArray *commodityItems;

@end

@implementation GMSubmitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提交订单";
    self.navigationController.navigationBarHidden = NO;
    
    // 商品价格
    // 商品数量

    
    [self initSubviews];
    
}


- (void)initSubviews {
    
    
    GMSubmitOrderBottomView *bottomView = [[GMSubmitOrderBottomView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    _submitButton = bottomView.submitButton;
    [_submitButton addTarget:self action:@selector(generateOrder) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = bottomView;
}

//- (void)clickSubmitButton {
//    
//    GMPaymentOrderViewController *paymentVC = [[GMPaymentOrderViewController alloc] init];
//    paymentVC.paymentOrderItem = _submitOrderItem;
//    [self.navigationController pushViewController:paymentVC animated:YES];
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 45;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
            // 商家标题
        case 0:
            return 1;
            break;
            // 商品 x数量  和价格
        case 1:
            return self.submitOrderItem.commodityItems.count;
            break;
            // 总计
        case 2:
            return 1;
            break;
            // 优惠券
        case 3:
            return 1;
            
            break;
            // 订单总价
        case 4:
            return 1;
            
            break;
            // 姓名 + 手机号
        case 5:
            return 2;
            break;
            // 备注
        case 6:
            
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *submitOrderCell = @"SubmitOrderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:submitOrderCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:submitOrderCell];
        
        
    if (indexPath.section == 0) {
        // 商家标题
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg"] placeholderImage:[UIImage imageNamed:@"maocai"]];
        cell.textLabel.text = self.submitOrderItem.merchantItem.merchantName;
        
    } else if (indexPath.section == 1) {
        // 商品
//        UITableViewCell *commodityCell = [tableView dequeueReusableCellWithIdentifier:@"commodityCell"];
//        
//        if (!commodityCell) {
//            commodityCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"commodityCell"];
//        
//        }
        
//        NSUInteger count = self.submitOrderItem.commodityItems.count;
//        for (int i = 0; i < count; i++) {
//            
//        }
        
//        // 先获取数据 存放在数组中, 再从数组中取值
//        NSArray *cells = [tableView visibleCells];
//        NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndex:1];
        
//        for (UITableViewCell *commodityCell in <#collection#>) {
//            
//        }
        

        
        GMCommodityItem *commodityItem = self.submitOrderItem.commodityItems[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@, 数量:%ld", commodityItem.commodityName, commodityItem.commodityQuantity];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%ld", commodityItem.price];
        

//        cell = self.commodityItems[indexPath.row];
        
        return cell;

    } else if (indexPath.section == 2) {
        
        // 总计
        // 总计
        cell.textLabel.text = @"总计";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%ld", self.submitOrderItem.orderTotalPrice];


        
//        // 根据ID 请求用户数据
//        GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
//        
//        NSString *ID = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
//        NSDictionary *p = @{
//                            @"id": ID
//                            };
//        
//        [manager POST:@"/server/authority/user/user/getById" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            
//            if (!responseObject) {
//                [SVProgressHUD showErrorWithStatus:@"网络错误"];
//                return ;
//            }
//            if ([responseObject[@"success"] boolValue] != YES) {
//                [SVProgressHUD showErrorWithStatus:@"返回错误"];
//                return;
//            }
//            
////            NSDictionary *data = responseObject[@"data"];
////            GMClientItem *item = [GMClientItem yy_modelWithJSON:data];
////            cell.detailTextLabel.text = item.phone;
//
////            dispatch_async(dispatch_get_main_queue(), ^{
////                cell.detailTextLabel.text = item.phone;
////            });
////            
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            
//        }];
        
//        switch (indexPath.row) {
//            case 0:
//                cell.textLabel.text = @"您绑定的手机号码";
//                
//                break;
//            case 1:
//                cell.textLabel.text = @"18603822757";
//                break;
//            default:
//                break;
//        }
    } else if (indexPath.section == 3) {
        // 优惠券
        cell.textLabel.text = @"优惠券";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"-¥%ld", (long)self.submitOrderItem.discount];
        
    } else if (indexPath.section == 4) {
        // 订单总价
        self.submitOrderItem.orderTotalPrice = self.submitOrderItem.orderTotalPrice - self.submitOrderItem.discount;
        cell.textLabel.text = @"实际付款";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%ld", self.submitOrderItem.orderTotalPrice];
        cell.detailTextLabel.textColor = [UIColor colorWithRed: 255.0/255.0 green: 120.0/255.0 blue: 102.0/255.0 alpha: 1.0];
        
    } else if (indexPath.section == 5) {
        // 手机号
        // 需要提前判断是否登录
        if (indexPath.row == 0) {
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = @"李俊龙";
            
            
            GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
            NSDictionary *p = @{
                                @"id": [[NSUserDefaults standardUserDefaults] valueForKey:@"id"]
                                };
            [manager POST:@"/server/authority/user/user/getById" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (!responseObject) {
                    [SVProgressHUD showErrorWithStatus:@"网络错误"];
                    return ;
                }
                if ([responseObject[@"success"] boolValue] != YES) {
                    [SVProgressHUD showErrorWithStatus:@"返回错误"];
                    return;
                }
                
                NSDictionary *d = responseObject[@"data"];
                
                // test
//                if ([d[@"nickName"] count] <= 0) {
//                    [d setValue:@"李俊龙" forKey:@"nickName"];
//                }
                
//                cell.detailTextLabel.text = d[@"nickName"];
                cell.detailTextLabel.text = @"李俊龙";
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
        } else if (indexPath.row == 1) {
            
            cell.textLabel.text = @"您绑定的手机号码为";
            cell.detailTextLabel.text =  [[NSUserDefaults standardUserDefaults] valueForKey:@"phone"];
        }
        

        
    } else if (indexPath.section == 6) {
        // 备注
        GMSubmitOrderRemarkCell *remarkCell = [tableView dequeueReusableCellWithIdentifier:@"remarkCell"];
        if (!remarkCell) {
            remarkCell = [[GMSubmitOrderRemarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"remarkCell"];
            
        }
        return remarkCell;
        
        
    }
        
    }
    
    if (_loginStatus) {
        
    }
    
    return cell;
}


/**
 生成订单
 */
- (void)generateOrder {
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 生成成功后跳转
        GMPaymentOrderViewController *paymentVC = [[GMPaymentOrderViewController alloc] init];
        paymentVC.paymentOrderItem = _submitOrderItem;
        [self.navigationController pushViewController:paymentVC animated:YES];
    });
    
    
//    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
//
//    // 遍历当前所有商品, 把商品id和数量拼接
//    NSMutableString *listStr = [NSMutableString string];
//    for (GMCommodityItem *item in self.submitOrderItem.commodityItems) {
//        [listStr appendFormat:@"%@,%ld;", item.id, item.commodityQuantity];
//    }
//    
//    NSRange range = NSMakeRange([listStr length] - 1, 1);
//    [listStr deleteCharactersInRange:range];
//    NSLog(@"%@", listStr);
//    
//    
//    NSDictionary *p = @{
//                        @"clientId": [[NSUserDefaults standardUserDefaults] valueForKey:@"id"],
//                        // 商家ID
//                        @"merchantId": self.submitOrderItem.merchantItem.id,
//                        @"list": listStr
//                        
//                        };
//    [manager POST:@"/client/order/order/insert" parameters:p progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        if (!responseObject) {
//            [SVProgressHUD showErrorWithStatus:@"网络错误"];
//            return ;
//        }
//        if ([responseObject[@"success"] boolValue] != YES) {
//            [SVProgressHUD showErrorWithStatus:@"返回错误"];
//            return;
//        } else if ([responseObject[@"success"] boolValue] == YES){
//            [SVProgressHUD showSuccessWithStatus:@"提交成功"];
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                // 生成成功后跳转
//                GMPaymentOrderViewController *paymentVC = [[GMPaymentOrderViewController alloc] init];
//                paymentVC.paymentOrderItem = _submitOrderItem;
//                [self.navigationController pushViewController:paymentVC animated:YES];
//            });
//           
//        }
//        
//        GMSubmitOrderItem *orderItem = [GMSubmitOrderItem yy_modelWithJSON:responseObject[@"data"]];
//        
//        
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (NSMutableArray *)commodityItems {
    if (!_commodityItems) {
        _commodityItems = [NSMutableArray array];
    }
    return _commodityItems;
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

