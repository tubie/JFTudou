//
//  JFSubscribeModel.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFSubscribeModel : NSObject
@property(nonatomic, strong) NSNumber *video_count;
@property(nonatomic, strong) NSString *Description;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *channelized_type;
@property(nonatomic, strong) NSString *subed_count;

@property(nonatomic, strong) NSMutableArray *last_item;
@property(nonatomic, strong) NSString *podcast_user_id;
@property(nonatomic, strong) NSString *isVuser;
@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *avatar;

@end
