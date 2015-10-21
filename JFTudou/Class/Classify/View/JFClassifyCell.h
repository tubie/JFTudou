//
//  JFClassifyCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFClassifyModel;
@interface JFClassifyCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView;


@property (weak, nonatomic) IBOutlet UIImageView *classifyImageView;
@property (weak, nonatomic) IBOutlet UILabel *classifyNameLabel;

@property(nonatomic, strong)JFClassifyModel *classifyModel;

@end
