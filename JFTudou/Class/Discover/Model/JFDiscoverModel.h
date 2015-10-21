//
//  JFDiscoverModel.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFDiscoverModel : NSObject
@property(nonatomic, strong) NSNumber *group_number;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, strong) NSString *skip_url;
@property(nonatomic, strong) NSString *sub_title;

@property(nonatomic, strong) NSString *module_icon;
@property(nonatomic, strong) NSString *sub_type;
@property(nonatomic, strong) NSNumber *group_location;


@end
