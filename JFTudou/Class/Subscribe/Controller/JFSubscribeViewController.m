//
//  JFSubscribeViewController.m
//  JFTuDou
//
//  Created by 保修一站通 on 15/10/9.
//  Copyright © 2015年 JF. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFSubscribeViewController.h"
#import "JFSubscribeModel.h"
#import "JFSubscribeCell.h"
#import "JFVideoDetailViewController.h"
#import "JFSubItemModel.h"
@interface JFSubscribeViewController ()<UITableViewDataSource,UITableViewDelegate,JFSubscribeCellDelagate>
{
    NSMutableArray *_dataSource;
}


@property (nonatomic, strong) UITableView *subscribeTableView;

@end

@implementation JFSubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
    [self setUpRefresh];
    
}

#pragma mark - 设置普通模式下啦刷新
-(void)setUpRefresh{
    self.subscribeTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initData];
    }];
    [self.subscribeTableView.header beginRefreshing];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

-(void)initNav{
    self.title = @"订阅推荐";
    
}
-(void)initData{
    _dataSource = [[NSMutableArray alloc] init];

    NSString *urlStr = [[GetUrlString sharedManager]urlWithSubscribeData];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        [self.subscribeTableView.header endRefreshing];
        NSMutableArray *array = [responseBody objectForKey:@"results"];
        for (int i = 0; i < array.count; i++) {
            JFSubscribeModel *subM = [JFSubscribeModel objectWithKeyValues:array[i]];
            [_dataSource addObject:subM];
            
        }
        [self.subscribeTableView reloadData];

    } failure:^(NSError *error) {
        
    }];
    
}
-(void)initView{
    self.subscribeTableView =  [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT  -64) withDelegate:self];
    [self.view addSubview:self.subscribeTableView];
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 215;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"JFSubscribeCell";
    JFSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFSubscribeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.delegate = self;
    
    JFSubscribeModel *subM = [_dataSource objectAtIndex:indexPath.row];    
    [cell setSubscribeM:subM];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectSubscribeCell:(JFSubscribeCell *)subCell subItem:(JFSubItemModel *)subItem{
    JFVideoDetailViewController *videoDetailVC = [[JFVideoDetailViewController alloc]init];
    videoDetailVC.iid = subItem.code;
    [self.navigationController pushViewController:videoDetailVC animated:YES];
    
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
