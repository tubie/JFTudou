//
//  JFMacro.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/15.
//  Copyright (c) 2015年 JF团购. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#ifndef JF___JFMacro_h
#define JF___JFMacro_h

//设备的宽高
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define navigationBarColor RGB(251, 117, 44)
#define separaterColor RGB(200, 199, 204)

//字体
#define kFONT16                  [UIFont systemFontOfSize:16.0f]
#define kFONT15                  [UIFont systemFontOfSize:15.0f]
#define kFONT12                  [UIFont systemFontOfSize:12.0f]
#define kFONT10                  [UIFont systemFontOfSize:10.0f]




//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//搜索文件
#define JFSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]


#import "UITableView+JFTableView.h"
#import "UIBarButtonItem+JFBarButtonItem.h"
#import "AFNetworking.h"
#import "NetWork.h"
#import "GetPlistArray.h"
#import "GetUrlString.h"
#import "UIView+JFLoadXib.h"
#import "JFBaseViewController.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"



#endif
