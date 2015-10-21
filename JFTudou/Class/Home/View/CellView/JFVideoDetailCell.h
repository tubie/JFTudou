//
//  JFVideoDetailCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/17.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFVideoDetailModel;
@interface JFVideoDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playItemsLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDesLabel;
@property (weak, nonatomic) IBOutlet UIButton *subscribeButton;
@property (weak, nonatomic) IBOutlet UILabel *subedNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property(nonatomic, strong)JFVideoDetailModel *videoDetailModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
