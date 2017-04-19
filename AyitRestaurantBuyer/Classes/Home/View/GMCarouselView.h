//
//  GMCarouselView.h
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/19.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMCarouselView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) NSInteger currentImageIndex;
- (void)reloadImage;
@end
