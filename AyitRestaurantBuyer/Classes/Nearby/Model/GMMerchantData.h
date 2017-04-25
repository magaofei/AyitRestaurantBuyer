//
//  GMMerchantData.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

/*
 {
 "success": true,
 "message": "get all merchants success",
 "data": [
 {
 "id": "123",
 "userid": null,
 "contact": null,
 "merchantName": "测试一下",
 "createTime": null,
 "phone": null,
 "address": null,
 "serviceTime": null,
 "discount": null,
 "licenseImgs": null,
 "showImgs": null,
 "logoImg": null,
 "open": false
 },
 {
 "id": "456",
 "userid": null,
 "contact": null,
 "merchantName": "你大爷",
 "createTime": null,
 "phone": null,
 "address": null,
 "serviceTime": null,
 "discount": null,
 "licenseImgs": null,
 "showImgs": null,
 "logoImg": null,
 "open": false
 }
 ]
 }
 */

#import <Foundation/Foundation.h>

@interface GMMerchantData : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *merchantName;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *serviceTime;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *licenseImgs;
@property (nonatomic, strong) NSString *showImgs;
@property (nonatomic, strong) NSString *logoImg;


@property (nonatomic, assign) BOOL open;






@end
