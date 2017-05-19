//
//  GMPaymentOrderViewController.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderItem;
@interface GMPaymentOrderViewController : UITableViewController

@property (nonatomic, strong) OrderItem *paymentOrderItem;

@end
