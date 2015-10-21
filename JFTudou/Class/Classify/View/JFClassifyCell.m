//
//  JFClassifyCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFClassifyCell.h"
#import "JFClassifyModel.h"
@implementation JFClassifyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFClassifyCell";
    JFClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFClassifyCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)setClassifyModel:(JFClassifyModel *)classifyModel{
    _classifyModel = classifyModel;
    [self.classifyImageView sd_setImageWithURL:[NSURL URLWithString:classifyModel.image_at_bottom] placeholderImage:[UIImage imageNamed:@"home_GaoXiao"]];
    self.classifyNameLabel.text = classifyModel.name;
    
}

@end
