//
//  JFLoginBtnCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFLoginBtnCell.h"

@implementation JFLoginBtnCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFLoginBtnCell";
    JFLoginBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFLoginBtnCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (IBAction)loginBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(loginBtnClick:)]) {
        [self.delegate loginBtnClick:sender];
    }
}

- (IBAction)xinlanWeiboBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(loginBtnClick:)]) {
        [self.delegate loginBtnClick:sender];
    }
}
@end
