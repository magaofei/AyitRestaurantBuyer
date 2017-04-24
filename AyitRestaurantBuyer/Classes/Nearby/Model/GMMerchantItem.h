//
//  GMMerchantItem.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMMerchantData.h"

@interface GMMerchantItem : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) GMMerchantData *data;




@end
