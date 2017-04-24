//
//  GMUserDefaults.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/23.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMUserDefaults.h"

@implementation GMUserDefaults

+ (void)saveUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"id" forKey:@"id"];
    [defaults setObject:@"userId" forKey:@"userId"];
    
//    [defaults setInteger:10 forKey:@"Age"];
//    
//    UIImage *image =[UIImage imageNamed:@"somename"];
//    NSData *imageData = UIImageJPEGRepresentation(image, 100);//把image归档为NSData
//    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];
}

+ (void)readUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *id = [defaults objectForKey:@"Id"];
    NSString *userId = [defaults objectForKey:@"userId"];
    
//    NSData *imageData = [defaults dataForKey:@"image"];
//    UIImage *image = [UIImage imageWithData:imageData];
}



@end
