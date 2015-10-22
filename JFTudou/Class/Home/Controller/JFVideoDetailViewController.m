//
//  JFVideoDetailViewController.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/17.
//  Copyright © 2015年 JF. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFVideoDetailViewController.h"
#import "JFVideoDetailModel.h"
#import "JFRecommentModel.h"
#import "JFVideoDetailCell.h"
#import "JFRecommentVideoCell.h"
@interface JFVideoDetailViewController ()<UITableViewDataSource, UITableViewDelegate>
{

    JFVideoDetailModel *_videoDM;
    NSMutableArray *_recommendArray;

}

@property(nonatomic, strong)UITableView *videoDetailTableView;
@property(nonatomic, strong)UIWebView *videoDetailWebView;

@end

@implementation JFVideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadVideoDetailData];
    [self loadRecommentData];
    [self initTableView];
    [self initWebView];
    [self initNav];
}

-(void)initNav{
    self.navigationController.navigationBar.hidden = YES;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 20)];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, 20, 30, 30);
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    backBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:backBtn];
    
}

#pragma mark - 初始化tableView
-(void)initTableView{
    self.videoDetailTableView = [UITableView initWithTableView:CGRectMake(0, 220, SCREENWIDTH, SCREENHEIGHT-220) withDelegate:self ];
    [self.view addSubview:self.videoDetailTableView];

}
#pragma mark - 初始化webView
-(void)initWebView{
    self.videoDetailWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, SCREENWIDTH, 220)];
    [self.view addSubview:self.videoDetailWebView];

}

-(void)OnBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark－视频详细信息
-(void)loadVideoDetailData{
    _videoDM = [[JFVideoDetailModel alloc] init];
    _recommendArray = [[NSMutableArray alloc] init];
    
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithVideoDetailData:self.iid];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        JFVideoDetailModel *videoDM = [JFVideoDetailModel objectWithKeyValues:[responseBody objectForKey:@"detail"]];
        _videoDM = videoDM;
        
        NSString *videoUrl = [[GetUrlString sharedManager]urlWithVideo:self.iid];
        [self.videoDetailWebView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:videoUrl]]];
        
        [self.videoDetailTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 推荐视频
-(void)loadRecommentData{
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithRecommentdata:self.iid];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        //这个地方要先移除模型数组里面数据
        [_recommendArray removeAllObjects];
        NSMutableArray *resultArray = [responseBody objectForKey:@"results"];
        for (int i = 0; i < resultArray.count; i++) {
            JFRecommentModel  *recommendM = [JFRecommentModel objectWithKeyValues:resultArray[i]];
            recommendM.time = [self convertTime:[recommendM.duration integerValue]];
            [_recommendArray addObject:recommendM];
        }
        [self.videoDetailTableView reloadData];
    } failure:^(NSError *error) {
        
    }];

}
-(NSString *)convertTime:(NSInteger)time{
    Float64 currentSeconds = time;
    int mins = currentSeconds/60.0;
    int hours = mins / 60.0f;
    int secs = fmodf(currentSeconds, 60.0);
    mins = fmodf(mins, 60.0f);
    
    NSString *hoursString = hours < 10 ? [NSString stringWithFormat:@"0%d", hours] : [NSString stringWithFormat:@"%d", hours];
    NSString *minsString = mins < 10 ? [NSString stringWithFormat:@"0%d", mins] : [NSString stringWithFormat:@"%d", mins];
    NSString *secsString = secs < 10 ? [NSString stringWithFormat:@"0%d", secs] : [NSString stringWithFormat:@"%d", secs];
    
    if (hours == 0) {
        return [NSString stringWithFormat:@"%@:%@",minsString, secsString];
    }else{
        return [NSString stringWithFormat:@"%@:%@:%@", hoursString,minsString, secsString];
    }
}
#pragma mark - UITableViewDataSource
//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _recommendArray.count + 1 ;
}
//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 160;
    }else{
        return 75;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JFVideoDetailCell *cell = [JFVideoDetailCell cellWithTableView:tableView];
        if (_videoDM) {
            cell.videoDetailModel = _videoDM;
        }
        return cell;
        
    }else{
        JFRecommentVideoCell *cell = [JFRecommentVideoCell cellWithTableView:tableView];
        cell.recommentModel = _recommendArray[indexPath.row-1];
        return cell;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row>0) {
        JFRecommentModel *recommendM = _recommendArray[indexPath.row-1];
        self.iid = recommendM.itemCode;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self loadVideoDetailData];
            [self loadRecommentData];
        });
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
