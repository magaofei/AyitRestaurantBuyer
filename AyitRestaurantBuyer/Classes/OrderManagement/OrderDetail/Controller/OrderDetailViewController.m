//
//  OrderDetailViewController.m
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  根据cell的ID 获取数据

#import "OrderDetailViewController.h"
#import "OrderDetailBottomView.h"
#import <Masonry/Masonry.h>
#import "OrderDetailHeaderCell.h"

#import <SDWebImage/UIImageView+WebCache.h>


@interface OrderDetailViewController ()

@property (nonatomic, strong) UIButton *cancelOrderButton;

@property (nonatomic, strong) UIButton *acceptOrderButton;

//@property (nonatomic, strong) UIButton *contactMerchantButton;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取数据
    [self initSubviews];
}
/**
 子View
 */
- (void)initSubviews {
    OrderDetailBottomView *bottomView = [[OrderDetailBottomView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    
    _cancelOrderButton = bottomView.cancelOrderButton;
    _acceptOrderButton = bottomView.acceptOrderButton;
//    _contactMerchantButton = bottomView.contactMerchantButton;
    
    self.tableView.tableFooterView = bottomView;
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 140;
    } else {
        return 45;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *headerCellName = @"headerCellName";
    static NSString *cellName = @"cellName";
    
    if (indexPath.section == 0) {
        OrderDetailHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:headerCellName];
        if (!headerCell) {
            headerCell = [[OrderDetailHeaderCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:headerCellName];
            
        }
        
        [headerCell.merchantIconImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg"]];
        headerCell.orderStatusLabel.text = @"订单已接收";
        
        return headerCell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
            
        }
        
        [self testSetupCell:cell index:indexPath];
        
        return cell;
    }
}

- (void)testSetupCell:(UITableViewCell *)cell index:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                // 菜品名
                cell.textLabel.text = @"地三鲜盖饭";
                //                cell.textLabel.textColor = [UIColor grayColor];
                cell.detailTextLabel.text = @"¥12";
                break;
                
            case 1:
                cell.textLabel.text = @"汽水";
                cell.detailTextLabel.text = @"¥3";
                break;
            case 2:
                cell.textLabel.text = @"新用户减三元";
                cell.detailTextLabel.text = @"-¥3";
                break;
            case 3:
                cell.detailTextLabel.text = @"实际付款¥9";
                cell.detailTextLabel.textColor = [UIColor redColor];
                cell.detailTextLabel.font = [UIFont systemFontOfSize:18];
            default:
                
                break;

        }
    } else if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"订单号:11232121211212";
                break;
            case 1:
                cell.textLabel.text = @"支付方式:在线支付";
                break;
            case 2:
                cell.textLabel.text = @"下单时间:2017-5-20 12:00";
                break;
            case 3:
                cell.textLabel.text = @"备注:一人用餐";
                break;
            default:
                break;
        }
    }
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
