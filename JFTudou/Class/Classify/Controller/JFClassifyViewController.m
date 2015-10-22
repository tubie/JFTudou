//
//  JFClassifyViewController.m
//  JFTuDou
//
//  Created by 保修一站通 on 15/10/9.
//  Copyright © 2015年 JF. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFClassifyViewController.h"
#import "JFClassifyCell.h"
#import "JFClassifyModel.h"
#import "JFWebViewController.h"
@interface JFClassifyViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_dataSource;
}
@property (nonatomic, strong)UITableView *classifyTableView;

@end

@implementation JFClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
//    [self setUpRefresh];
    [self initData];

    // Do any additional setup after loading the view.
}

#pragma mark - 设置普通模式下啦刷新
-(void)setUpRefresh{
    self.classifyTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initData];
    }];
    [self.classifyTableView.header beginRefreshing];
}

#pragma mark - 初始化导航栏
-(void)initNav{
    self.title = @"分类";
}


-(void)initData{
    _dataSource = [[NSMutableArray alloc] init];
    NSString *urlStr = [[GetUrlString sharedManager]urlWithclassifyData];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        [self.classifyTableView.header endRefreshing];
        [_dataSource removeAllObjects];
        NSMutableArray *array = [responseBody objectForKey:@"results"];
        for (int i = 0; i < array.count; i++) {
            JFClassifyModel *classM = [JFClassifyModel objectWithKeyValues:array[i]];
            [_dataSource addObject:classM];
            [self.classifyTableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
-(void)initView{
    self.classifyTableView =  [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.classifyTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_dataSource) {
        return _dataSource.count;
    }else{
        return 0;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFClassifyCell *cell = [JFClassifyCell cellWithTableView:tableView];
    if (_dataSource) {
        cell.classifyModel = [_dataSource objectAtIndex:indexPath.row];

    }
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JFWebViewController *webVC = [[JFWebViewController alloc]init];
    webVC.urlStr = [[GetUrlString sharedManager]urlWithJianShuData];
    [self.navigationController pushViewController:webVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
