//
//  GMNearbyViewController.m
//  AyitRestaurantBuyer
//
//  Created by MAMIAN on 2017/4/11.
//  Copyright © 2017年 Gaofei Ma. All rights reserved.
//  {"success":true,"message":"get all merchants success","data":[{"id":"123","userid":null,"contact":null,"merchantName":"测试一下","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false},{"id":"456","userid":null,"contact":null,"merchantName":"你大爷","createTime":null,"phone":null,"address":null,"serviceTime":null,"discount":null,"licenseImgs":null,"showImgs":null,"logoImg":null,"open":false}]}


#import "GMNearbyViewController.h"
#import "GMNearbySellerTableViewCell.h"
#import "GMDetailGoodsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
#import <YYModel/YYModel.h>
#import <SVProgressHUD/SVProgressHUD.h>

#import "GMHTTPNetworking.h"
#import "GMMerchantItem.h"

#import "GMMerchantViewController.h"

@interface GMNearbyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *merchantItems;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIBarButtonItem *locationButton;

@end

static NSString *cellName = @"nearbyCell";
static NSString *carouselCell = @"carouselCell";
@implementation GMNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"附近商家";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    GMMerchantItem *merchantItem = [[GMMerchantItem alloc] init];
//    merchantItem.logoImg = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg";
//    merchantItem.merchantName = @"定正成都冒菜";
//    merchantItem.discount = @"新用户下单立减7.0";
//    merchantItem.address = @"1.7";
//    
//    
//    [self.merchantItems addObject:merchantItem];
    
    [self initSubviews];
    
    [self initWithData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *)merchantItems {
    if (!_merchantItems) {
        _merchantItems = [NSMutableArray array];
    }
    return _merchantItems;
}



- (void)initSubviews {
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 100;
    [self.view addSubview: _tableView];
    
//    _locationButton = [[UIBarButtonItem alloc] initWithTitle:@"校园第一餐厅" style:UIBarButtonItemStylePlain target:self action:nil];
    
    // 设置左上角地理位置button
    UIView* leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 110, 50)];
    
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.backgroundColor = [UIColor clearColor];
    leftButton.frame = leftButtonView.frame;
    [leftButton setImage:[UIImage imageNamed:@"nearby"] forState:UIControlStateNormal];
    [leftButton setTitle:@"第一餐厅" forState:UIControlStateNormal];
    leftButton.tintColor = [UIColor whiteColor]; //Your desired color.
    leftButton.autoresizesSubviews = YES;
    leftButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
//    [leftButton addTarget:self action:@selector(<YourTargetMethod>) forControlEvents:UIControlEventTouchUpInside];
    [leftButtonView addSubview:leftButton];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftButtonView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    
    
    [self initLayoutSubviews];
}

- (void)initLayoutSubviews {
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view);
        make.right.bottom.equalTo(self.view);
    }];
}


#pragma mark - customMethod
- (void)initWithData {
    GMHTTPNetworking *manager = [GMHTTPNetworking sharedManager];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"/server/merchant/merchant/allMerchants" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!responseObject) {
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
            return ;
        }
        
//        NSLog(@"%@", responseObject[@"success"]);
        if ([responseObject[@"success"] boolValue] != YES) {
            [SVProgressHUD showErrorWithStatus:@"返回错误"];
            return;
        }
        
        NSArray *data = responseObject[@"data"];
        GMMerchantItem *item = [[GMMerchantItem alloc] init];
        for (NSDictionary *a in data) {
            item = [GMMerchantItem yy_modelWithJSON:a];
            [self.merchantItems addObject:item];
        }
        
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"加载失败");
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.merchantItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GMNearbySellerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[GMNearbySellerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    // cell code
    
//    if (_items) {
//        GMMerchantItem *item = _items[indexPath.row];
//
//        return cell;
//    }
    
    // cell setup
    
//    cell.nameLabel.text = item.contact;
//    cell.phoneLabel.text = item.phone;
    
    if (self.merchantItems.count <= 0) {
        return cell;
    }
    
    GMMerchantItem *item = self.merchantItems[indexPath.row];
    [cell.merchantIcon sd_setImageWithURL:[NSURL URLWithString:item.logoImg] placeholderImage:[UIImage imageNamed:@"maocai"]];
    
    cell.merchantTitleLabel.text = item.merchantName;
    cell.salesLabel.text = @"月售17单";
    cell.locationInfoLabel.text = @"1.7km";
    cell.discountLabel.text = @"新用户下单立减7.0";
    
//    [self setupCell:cell];
//    [self testCellData:cell];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转到商家详情页
    GMMerchantViewController *merchantVC = [[GMMerchantViewController alloc] init];
    // 传递模型
    GMMerchantItem *item = self.merchantItems[indexPath.row];
    merchantVC.merchantItem = item;

    
    merchantVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:merchantVC animated:YES];
    
    
}

-(void)setupCell:(GMNearbySellerTableViewCell *)cell {

    
//    [cell.merchantIcon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1494435312216&di=9b089188954a5dc82837a1a7a24dc66b&imgtype=0&src=http%3A%2F%2Fs1.nuomi.bdimg.com%2Fupload%2Fdeal%2F2014%2F6%2FV_L%2F1151192-fngqb4b3s6-3204626805425021.jpg"]];
//    cell.merchantTitleLabel.text = @"定正成都冒菜";
//    cell.salesLabel.text = @"月售17单";
//    cell.locationInfoLabel.text = @"1.7km";
//    cell.discountLabel.text = @"新用户下单立减7.0";
    
    
    
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
