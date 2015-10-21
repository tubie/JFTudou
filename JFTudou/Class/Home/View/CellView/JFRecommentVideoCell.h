//
//  JFRecommentVideoCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/17.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFRecommentModel;
@interface JFRecommentVideoCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *PVLabel;
@property(nonatomic, strong)JFRecommentModel *recommentModel;
@end
