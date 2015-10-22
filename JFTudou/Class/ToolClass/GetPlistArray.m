//
//  GetPlistArray.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/16.
//  Copyright (c) 2015年 JF团购. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "GetPlistArray.h"

@implementation GetPlistArray
+(NSArray *)arrayWithString:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}


@end
