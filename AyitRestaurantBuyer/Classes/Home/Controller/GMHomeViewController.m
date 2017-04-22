//
//  GMHomeViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  上面放一个轮播器
//  下面放Cell

#import "GMHomeViewController.h"
#import "GMGoodsTableViewCell.h"
#import "GMCarouselCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import <Masonry/Masonry.h>
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface GMHomeViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

//@property (nonatomic, strong) GMCarouselView *carouselView;

// tableView
@property (nonatomic, strong) UITableView *tableView;

// 轮播器

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UIScrollView *carouselView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) NSInteger currentImageIndex;

@property (nonatomic, assign) NSInteger imageCount;


/**
 首页商品数量
 */
@property (nonatomic, strong) NSArray *goods;
@property (nonatomic, strong) NSArray *carousel;

@end

static NSString *cellName = @"goodsCell";
static NSString *carouselCell = @"carouselCell";
static NSUInteger carouselViewHeight = 200;
@implementation GMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self initSubviews];
}

- (void)initSubviews {
//    _carouselView = [[GMCarouselView alloc] init];
//    _carouselView.scrollView.delegate = self;
    
//    [self.view addSubview:_carouselView];
    
//    [self initCarouselView];
    
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 130;
    
//    _tableView.scrollEnabled = NO;
    
    
    [self.view addSubview:_tableView];
    
    [self initLayoutSubviews];
    
}

- (void)initLayoutSubviews {
//    [_carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//    }];
    
//    [_carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//        make.height.equalTo(@(carouselViewHeight));
//    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_carouselView.mas_bottom);
        make.top.equalTo(self.view.mas_top);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    
}




#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 5;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        GMCarouselCell *cell = [tableView dequeueReusableCellWithIdentifier:carouselCell];
        if (!cell) {
            cell = [[GMCarouselCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:carouselCell];
        }
        
        // setup
        return cell;
    } else  {
        GMGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[GMGoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
            
        }
        
        
        
        [self testCellData:cell];
        return cell;
    }
    
    
    
    // cell setup
    
    
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 取消键盘
    //    [_orderSearchBar endEditing:YES];
    //    NSLog(@"%s", __func__);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选择
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)testCellData:(GMGoodsTableViewCell *)cell {
    cell.nameLabel.text = @"小马家常菜";
    
    [cell.goodsIcon sd_setImageWithURL:[NSURL URLWithString:@"http://img.spriteapp.cn/ugc/2016/03/10/092924_69853.jpg"]];
    cell.phoneLabel.text = @"手机号:19603822432";
    cell.goodsTitleLabel.text = @"红烧带鱼+米饭+豆角茄子";
    cell.orderTimeLabel.text = @"2017.04.12 12:30:02";
    cell.goodsPriceLabel.text = @"$216.50";
//    cell.orderStatusLabel.text = @"状态:已接受";
    
}


#pragma mark - 停止滚动后

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
//    [_carouselView reloadImage];
//    [_carouselView.scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
//    _carouselView.pageControl.currentPage=_carouselView.currentImageIndex;
    
    [self reloadImage];
    [_carouselView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    _pageControl.currentPage=_currentImageIndex;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
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
    _carouselView = [[UIScrollView alloc] init];
    _carouselView.frame = CGRectMake(0, 0, screenWidth, carouselViewHeight);
    [self.view addSubview:_carouselView];
    _carouselView.delegate = self;
    
    _carouselView.contentSize = CGSizeMake(3 * screenWidth, carouselViewHeight);
    [_carouselView setContentOffset:CGPointMake(screenWidth, 0) animated:YES];
    _carouselView.pagingEnabled = YES;
    _carouselView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 添加图片三个控件

- (void)addImageViews{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, carouselViewHeight)];
    
    _leftImageView.contentMode=UIViewContentModeScaleAspectFit;
    [_carouselView addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth, carouselViewHeight)];
    _centerImageView.contentMode=UIViewContentModeScaleAspectFit;
    [_carouselView addSubview:_centerImageView];
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * screenWidth, 0, screenWidth, carouselViewHeight)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_carouselView addSubview:_rightImageView];
    
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
    _pageControl.center=CGPointMake(screenWidth / 2, carouselViewHeight);
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    _pageControl.numberOfPages = _imageCount;
    [self.view addSubview: _pageControl];
}



#pragma mark - 重新加载图片

- (void)reloadImage{
    NSInteger leftImageIndex,rightImageIndex;
    CGPoint offset=[_carouselView contentOffset];
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





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
