//
//  JFTabBarViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/11.
//  Copyright (c) 2015年 JF团购. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFTabBarViewController.h"
#import "JFNavigationController.h"
#import "JFTabBar.h"
#import "ViewController.h"
#import "JFClassifyViewController.h"
#import "JFDiscoverViewController.h"
#import "JFMineViewController.h"
#import "JFSubscribeViewController.h"
@interface JFTabBarViewController ()<tabbarDelegate>

@property(nonatomic ,strong)JFTabBar *costomTabBar;

@end

@implementation JFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabbar
    [self setUpTabBar];

    //添加子控制器
    [self setUpAllChildViewController];
}

//取出系统自带的tabbar并把里面的按钮删除掉
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    for ( UIView * child in  self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setUpTabBar{
    JFTabBar *customTabBar = [[JFTabBar alloc]init];
    customTabBar.delegate = self;
//    customTabBar.backgroundColor = [UIColor redColor];
    customTabBar.frame = self.tabBar.bounds;
    self.costomTabBar = customTabBar;
    [self.tabBar addSubview:customTabBar];
    
}
-(void)tabBar:(JFTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    self.selectedIndex = to;
    
}

-(void)setUpAllChildViewController{
    ViewController *homeVC = [[ViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"home_homepage_notselected" seleceImageName:@"home_homepage_selected"];
    
    JFClassifyViewController *visitVC = [[JFClassifyViewController alloc]init];
    [self setupChildViewController:visitVC title:@"分类" imageName:@"home_classify_notselected" seleceImageName:@"home_classify_selected"];
    
    JFSubscribeViewController *merchantVC = [[JFSubscribeViewController alloc]init];
    [self setupChildViewController:merchantVC title:@"订阅" imageName:@"home_subscribe" seleceImageName:@"home_subscribe_selected"];
    
    JFDiscoverViewController *mineVC = [[JFDiscoverViewController alloc]init];
    [self setupChildViewController:mineVC title:@"发现" imageName:@"home_find_notselected" seleceImageName:@"home_find_selected"];
    
    JFMineViewController *moreVC = [[JFMineViewController alloc]init];
    [self setupChildViewController:moreVC title:@"我的" imageName:@"home_mine_notselected" seleceImageName:@"home_mine_selected"];
    
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
//    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //包装导航控制器
    JFNavigationController *nav = [[JFNavigationController alloc]initWithRootViewController:controller];
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
    
    [self.costomTabBar addTabBarButtonWithItem:controller.tabBarItem];
    
}




@end
