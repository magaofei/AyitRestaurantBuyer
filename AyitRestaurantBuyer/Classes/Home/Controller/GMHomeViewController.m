//
//  GMHomeViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  上面放一个轮播器
//  下面放Cell

#import "GMHomeViewController.h"
#import "GMCarouselView.h"
#import "GMGoodsTableViewCell.h"

#import <Masonry/Masonry.h>
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface GMHomeViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) GMCarouselView *carouselView;

// tableView
@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellName = @"goodsCell";
@implementation GMHomeViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initSubviews];
}

- (void)initSubviews {
    _carouselView = [[GMCarouselView alloc] init];
    _carouselView.scrollView.delegate = self;
    
    [self.view addSubview:_carouselView];
    
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    
}

- (void)initLayoutSubviews {
    [_carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    
}




#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GMGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == NULL) {
        cell = [[GMGoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    // cellSetup
    
    return cell;
}


#pragma mark - 停止滚动后

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [_carouselView reloadImage];
    [_carouselView.scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    _carouselView.pageControl.currentPage=_carouselView.currentImageIndex;
    
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
