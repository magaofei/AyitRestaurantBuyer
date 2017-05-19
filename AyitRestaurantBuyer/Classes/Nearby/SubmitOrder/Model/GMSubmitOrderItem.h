//
//  GMSubmitOrderItem.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/5/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

/**
 "id":"5911bb387874bb2dac8bb380",
 "clientId":"5911b3e97874bb04d09e02e2",
 "clientName":"客户1",
 "clientPhone":"18603822757",
 "clientAddress":"测试",
 "merchantId":"5911b0557874bb37a4c61cbf",
 "merchantName":"开了个店铺",
 "merchantPhone":"18337175639",
 "merchantAddress":"北京市昌平区龙锦苑东四区",
 "createTime":1494334259159,
 "commondityList":[
 {
 "commondityId":"5911afa17874bb37a4c61cbe",
 "commondityName":"显示器",
 "price":1300.9,
 "payPrice":null,
 "number":2,
 "showImg":null
 }
 ],
 "orderPrice":2601.8,
 "coupon":null,
 "payType":null,
 "transportType":null,
 "predictArrivalTime":1494334259159,
 "isOrderTaking":false,
 "orderState":null,
 "orderEndTime":1494334259159,
 "deleteState":null,
 "isRevocable":true,
 "revocableState":null,
 "remarks":null,
 "actualArrivalTime":1494334259159
 }
 */

#import <Foundation/Foundation.h>

@interface GMSubmitOrderItem : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *clientId;

@property (nonatomic, copy) NSString *clientName;

@property (nonatomic, copy) NSString *clientPhone;

@property (nonatomic, copy) NSString *merchantId;

@end
