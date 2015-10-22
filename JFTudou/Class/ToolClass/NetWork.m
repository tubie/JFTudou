//
//  NetWork.m
//  JF团购
//
//  Created by 保修一站通 on 15/8/15.
//  Copyright (c) 2015年 JF团购. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "NetWork.h"
@implementation NetWork

+(void)sendGetUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        success(responseObject);
    }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];

}

+(void)sendGetByReplacingUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         success(responseObject);
     }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
    
    
}


@end
