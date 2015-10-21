//
//  JFDiscoverCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFDiscoverModel;
@interface JFDiscoverCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *discoverImageView;
@property (weak, nonatomic) IBOutlet UILabel *discoverDetailLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFDiscoverModel *discoverModel;

@end
