//
//  GMLocation.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/23.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GMLocation ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@end

@implementation GMLocation

- (void)initLocation {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [_locationManager startUpdatingLocation];
    [_locationManager requestWhenInUseAuthorization]; // Add This Line
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%f", manager.location.coordinate.latitude);
}


@end
