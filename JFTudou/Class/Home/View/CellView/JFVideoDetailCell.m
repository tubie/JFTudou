//
//  JFVideoDetailCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/17.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFVideoDetailCell.h"
#import "JFVideoDetailModel.h"
@implementation JFVideoDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFVideoDetailCell";
    JFVideoDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFVideoDetailCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setVideoDetailModel:(JFVideoDetailModel *)videoDetailModel{
    _videoDetailModel = videoDetailModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:videoDetailModel.channel_pic] placeholderImage:[UIImage imageNamed:@"tudoulogo"]];
    _userNameLabel.text = videoDetailModel.username;
    _playItemsLabel.text = [NSString stringWithFormat:@"播放：%@",videoDetailModel.user_play_times];
    _userDesLabel.text = videoDetailModel.user_desc;
    
    self.subedNumberLabel.text = [NSString stringWithFormat:@"%d人订阅",[videoDetailModel.subed_num intValue]];
//    CGSize contentSize = [videoDetailModel.desc sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(SCREENWIDTH-30, 60) lineBreakMode:NSLineBreakByTruncatingTail];
    _titleLabel.text = videoDetailModel.title;
    _descLabel.text = videoDetailModel.desc;
}
@end
