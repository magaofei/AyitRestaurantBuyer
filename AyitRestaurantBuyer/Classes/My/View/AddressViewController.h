//
//  AddressViewController.h
//  AyitRestaurantSeller
//
//  Created by MAMIAN on 2017/4/16.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController

@property (nonatomic, strong) NSString *addressStr;

@property (nonatomic,copy) void (^change)(NSString* stringName);//block 写法1


@end
