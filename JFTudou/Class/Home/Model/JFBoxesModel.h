//
//  JFBoxesModel.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/12.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFBoxesModel : NSObject
@property(nonatomic, strong) NSMutableArray *videos;
@property(nonatomic, strong) NSNumber *ipad_display_type;
@property(nonatomic, strong) NSString *index_page_channel_icon;
@property(nonatomic, strong) NSNumber *display_type;
@property(nonatomic, strong) NSString *index_page_channel_icon_for_ipad;

@property(nonatomic, strong) NSNumber *video_count_for_ipad_index_page;
@property(nonatomic, strong) NSString *cid;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *sub_title;
@property(nonatomic, strong) NSString *redirect_type;

@property(nonatomic, strong) NSString *url_for_more_link;
@property(nonatomic, strong) NSString *is_podcast;

@property(nonatomic, assign) float height;

@end
