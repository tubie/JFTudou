//
//  JFHomeBoxCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/15.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFBoxesModel,JFVideosModel;


@protocol JFHomeBoxCellDelegate <NSObject>

@optional
-(void)didSelectHomeBox:(JFVideosModel *)video;

@end


@interface JFHomeBoxCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView ;


@property(nonatomic, strong) JFBoxesModel *boxes;
@property(nonatomic, weak) id <JFHomeBoxCellDelegate>delegate;


@end
