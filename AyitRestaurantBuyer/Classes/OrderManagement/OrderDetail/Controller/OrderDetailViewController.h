//
//  OrderDetailViewController.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderItem.h"

@interface OrderDetailViewController : UITableViewController

@property (nonatomic, strong) OrderItem *orderItem;

@end
