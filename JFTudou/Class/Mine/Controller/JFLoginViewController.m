//
//  JFLoginViewController.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFLoginViewController.h"
#import "JFTextFieldCell.h"
#import "JFLoginBtnCell.h"
@interface JFLoginViewController ()<UITableViewDataSource, UITableViewDelegate,JFLoginBtnCellDelegate>

@property (nonatomic, strong)UITableView *loginTableView;

@end

@implementation JFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self initView];
    
}
-(void)initView{
   
    self.loginTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) withDelegate:self];
    self.loginTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.loginTableView];
    self.view.backgroundColor = RGB(249, 249, 249);

}

-(void)initNav{
    
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"登陆";
    
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"ic_player_back" target:self action:@selector(leftBarButtonItemClick) width:35 height:35];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}
-(void)leftBarButtonItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return  70;
    }else{
        return 180;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JFTextFieldCell *cell = [JFTextFieldCell cellWithTableView:tableView];
        return cell;
    }else{
        JFLoginBtnCell *cell = [JFLoginBtnCell cellWithTableView:tableView];
        cell.delegate  = self;
        return cell;
    }

}
-(void)loginBtnClick:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
