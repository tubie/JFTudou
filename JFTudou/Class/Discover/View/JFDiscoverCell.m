//
//  JFDiscoverCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFDiscoverCell.h"
#import "JFDiscoverModel.h"
@implementation JFDiscoverCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFDiscoverCell";
    JFDiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFDiscoverCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setDiscoverModel:(JFDiscoverModel *)discoverModel{
    _discoverModel = discoverModel;
    self.discoverDetailLabel.text = discoverModel.title;
    [self.discoverImageView sd_setImageWithURL:[NSURL URLWithString:discoverModel.module_icon]  placeholderImage:[UIImage imageNamed:@"home_GaoXiao"]];

}
@end
