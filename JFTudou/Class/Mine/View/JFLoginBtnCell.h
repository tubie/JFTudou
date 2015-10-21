//
//  JFLoginBtnCell.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFLoginBtnCellDelegate <NSObject>
@optional
-(void)loginBtnClick:(UIButton *)sender;

@end

@interface JFLoginBtnCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (IBAction)loginBtnClick:(id)sender;
- (IBAction)xinlanWeiboBtnClick:(id)sender;

@property(nonatomic, weak)id <JFLoginBtnCellDelegate>delegate;


@end
