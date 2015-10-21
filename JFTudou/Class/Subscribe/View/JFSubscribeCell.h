//
//  JFSubscribeCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFSubscribeModel,JFSubscribeCell,JFSubItemModel;


@protocol JFSubscribeCellDelagate <NSObject>

-(void)didSelectSubscribeCell:(JFSubscribeCell *)subCell subItem:(JFSubItemModel *)subItem;

@end
@interface JFSubscribeCell : UITableViewCell

@property(nonatomic, strong)JFSubscribeModel *subscribeM;

@property(nonatomic, weak)id <JFSubscribeCellDelagate>delegate;


@end
