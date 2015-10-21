//
//  GetUrlString.h
//  JF团购
//
//  Created by 保修一站通 on 15/8/15.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JFHomeServiceModel;
@interface GetUrlString : NSObject
/**
 *  获取URL的单例
 */
+(GetUrlString *)sharedManager;

/*主界面的数据*/
-(NSString *)urlWithHomeData;
/*分类的数据*/
-(NSString *)urlWithclassifyData;
/*发现的数据*/
-(NSString *)urlWithDiscoverData;
/*订阅的数据*/
-(NSString *)urlWithSubscribeData;
/*
 *视频详情
 */
-(NSString*)urlWithVideoDetailData:(NSString *)iid;
/*
 *视频链接
 */
-(NSString*)urlWithVideo:(NSString *)iid;
/*
 *视频推荐
 */
-(NSString *)urlWithRecommentdata:(NSString *)iid;
/*
 *简书数据
 */
-(NSString *)urlWithJianShuData;






@end
