//
//  JFDiscoverViewController.m
//  JFTuDou
//
//  Created by 保修一站通 on 15/10/9.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFDiscoverViewController.h"
#import "JFDiscoverModel.h"
#import "JFImageScrollCell.h"
#import "JFDiscoverCell.h"
#import "JFSearchTextField.h"
#import "JFSearchViewController.h"
#import "JFSearchHistoryViewController.h"
#import "JFSearchButton.h"
#import "UIButton+JFButton.h"
#import "JFImageScrollView.h"
#import "JFVideoDetailViewController.h"
#import "JFWebViewController.h"
@interface JFDiscoverViewController ()<UITableViewDataSource, UITableViewDelegate,JFImageScrollViewDelegate>
{
    NSMutableArray *_dataSource;
    NSMutableArray *_imageArray;
    
    UILabel *_searchLabel;
}

@property(nonatomic, strong)UITableView *discoverTableView;

@end

@implementation JFDiscoverViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
    [self setUpRefresh];
}

#pragma mark - 设置普通模式下啦刷新
-(void)setUpRefresh{
    self.discoverTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initData];
    }];
    [self.discoverTableView.header beginRefreshing];
}

-(void)initNav{
    
    CGFloat w = SCREENWIDTH * 0.8;
    JFSearchButton *searchButton = [JFSearchButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, w, 30);
    [searchButton setBackgroundImage:[UIImage imageNamed:@"GroupCell"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"searchm"] forState:UIControlStateNormal];
    [searchButton setTitle:@"请输入：港囧，夏洛特烦恼，徐峥等" forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    
    
    //取消按钮
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithNormalImage:@"ic_discover_QR-code" target:self action:@selector(scanningClick) width:25 height:25];
    self.navigationItem.rightBarButtonItem = rightItem;
    

}
-(void)scanningClick{

}
-(void)searchButtonClick{
    JFSearchHistoryViewController *searchVC = [[JFSearchHistoryViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];

}


-(void)initView{
    self.discoverTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.discoverTableView];
    
}

-(void)initData{
    _dataSource = [[NSMutableArray alloc] init];
    _imageArray = [[NSMutableArray alloc] init];
    NSString *urlStr =[[GetUrlString sharedManager]urlWithDiscoverData];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        [self.discoverTableView.header endRefreshing];
        NSString *hotWord = [responseBody objectForKey:@"search_hot_word"];
        NSString *WordAd = [responseBody objectForKey:@"search_word_ad"];
        _searchLabel.text = [NSString stringWithFormat:@"%@:%@",WordAd,hotWord];
        [_dataSource removeAllObjects];
        NSMutableArray *resultArray = [responseBody objectForKey:@"results"];
        for (int i = 0; i < resultArray.count; i++) {
            JFDiscoverModel *disM = [JFDiscoverModel objectWithKeyValues:resultArray[i]];
            [_dataSource addObject:disM];
            if (i == 0) {
                [_imageArray removeAllObjects];
                NSMutableArray *imgArr = disM.items;
                for (int j = 0; j < imgArr.count; j++) {
                    NSString *picStr = [imgArr[j] objectForKey:@"image_640_210"];
                    [_imageArray addObject:picStr];
                }
            }
        }
        
        [self.discoverTableView reloadData];

    } failure:^(NSError *error) {
        
    }];

}
#pragma mark - UITableViewDataSource
//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataSource.count;
}
//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 130;
    }else{
        return 40;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JFImageScrollCell *cell = [JFImageScrollCell cellWithTableView:tableView frame:CGRectMake(0, 0, SCREENWIDTH, 130)];
        [cell setImageArray:_imageArray];
        cell.imageScrollView.delegate = self;
        return cell;
    }else{
        JFDiscoverCell *cell = [JFDiscoverCell cellWithTableView:tableView];
        cell.discoverModel = _dataSource[indexPath.row];
        return cell;
    }
    return nil;


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 0 ) {
        JFWebViewController *webVC = [[JFWebViewController alloc]init];
        webVC.urlStr = [[GetUrlString sharedManager]urlWithJianShuData];
        [self.navigationController pushViewController:webVC animated:YES];
    }


}

#pragma mark - JFImageScrollViewDelegate
-(void)didSelectImageAtIndex:(NSInteger)index{
    JFDiscoverModel *disM = _dataSource[0];
    NSString *code = [disM.items[index] objectForKey:@"video_id"];
    
    JFVideoDetailViewController  *videoVC = [[JFVideoDetailViewController alloc] init];
    videoVC.iid = code;
    [self.navigationController pushViewController:videoVC animated:YES];

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
