//
//  JFWatchRecordViewController.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFWatchRecordViewController.h"

@interface JFWatchRecordViewController ()

@end

@implementation JFWatchRecordViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
}

-(void)initNav{
    self.title = @"观看纪录";
    self.navigationController.navigationBar.hidden = NO;
    
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"ic_player_back" target:self action:@selector(leftBarButtonItemClick) width:35 height:35];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;


}

-(void)leftBarButtonItemClick{
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
