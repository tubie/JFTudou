//
//  JFRecommentVideoCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/17.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFRecommentVideoCell.h"
#import "JFRecommentModel.h"
@implementation JFRecommentVideoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFRecommentVideoCell";
    JFRecommentVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFRecommentVideoCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setRecommentModel:(JFRecommentModel *)recommentModel{
    _recommentModel = recommentModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:recommentModel.img] placeholderImage:[UIImage imageNamed:@"rec_holder"]];
    _titleLabel.text = recommentModel.title;
    self.PVLabel.text = recommentModel.pv_pr;
    _timeLabel.text = recommentModel.time;
}
@end
