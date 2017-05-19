//
//  GMSubmitOrderViewController.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/8.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderItem;
@interface GMSubmitOrderViewController : UITableViewController

@property (nonatomic, assign) BOOL loginStatus;

//@property (nonatomic, strong) NSString *iD;

@property (nonatomic, strong) OrderItem *submitOrderItem;

@end
