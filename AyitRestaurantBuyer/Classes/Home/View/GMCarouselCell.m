//
//  GMCarouselCell.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/22.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//

#import "GMCarouselCell.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

static NSUInteger height = 120;

@interface GMCarouselCell () <UIScrollViewDelegate>

// 轮播器

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *rightImageView;


@property (nonatomic, assign) NSInteger imageCount;

@end

@implementation GMCarouselCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    
    
    return self;
}


- (void)initSubviews {
    [self initCarouselView];
}

/**
 轮播器
 */
- (void)initCarouselView {
    _imageCount = 5;
    //添加滚动控件
    [self addScrollView];
    //添加图片控件
    [self addImageViews];
    //添加分页控件
    [self addPageControl];
    //加载默认图片
    [self setDefaultImage];
    
    
}

#pragma mark - 添加scroll控件

- (void)addScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(3 * screenWidth, height);
    [_scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:YES];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 添加图片三个控件

- (void)addImageViews{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, height)];
    _leftImageView.contentMode=UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth, height)];
    _centerImageView.contentMode=UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * screenWidth, 0, screenWidth, height)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImageView];
    
}

#pragma mark - 设置默认显示图片

- (void)setDefaultImage{
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg",_imageCount-1]];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",0]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",1]];
    _currentImageIndex = 0;
    _pageControl.currentPage = _currentImageIndex;
    
}

#pragma mark - 添加分页控件

- (void)addPageControl{
    _pageControl = [[UIPageControl alloc]init];
    CGSize size = [_pageControl sizeForNumberOfPages:_imageCount];
    _pageControl.bounds=CGRectMake(0, 0, size.width, size.height);
    _pageControl.center=CGPointMake(screenWidth / 2, height);
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    _pageControl.numberOfPages = _imageCount;
    [self addSubview: _pageControl];
}



#pragma mark - 重新加载图片

- (void)reloadImage{
    NSInteger leftImageIndex,rightImageIndex;
    CGPoint offset=[_scrollView contentOffset];
    if (offset.x > screenWidth) { //向右滑动
        _currentImageIndex=(_currentImageIndex+1)%_imageCount;
    }else if(offset.x < screenWidth){ //向左滑动
        _currentImageIndex=(_currentImageIndex+_imageCount-1)%_imageCount;
    }
    _centerImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg",_currentImageIndex]];
    //重新设置左右图片
    leftImageIndex = (_currentImageIndex + _imageCount-1) % _imageCount;
    rightImageIndex = (_currentImageIndex+1) % _imageCount;
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg", leftImageIndex]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li.jpg", rightImageIndex]];
}

#pragma mark - 停止滚动后

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //    [_carouselView reloadImage];
    //    [_carouselView.scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    //    _carouselView.pageControl.currentPage=_carouselView.currentImageIndex;
    
    [self reloadImage];
    [_scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    _pageControl.currentPage=_currentImageIndex;
    
}
@end
