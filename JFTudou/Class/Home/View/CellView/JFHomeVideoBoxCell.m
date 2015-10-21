//
//  JFHomeVideoBoxCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/15.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFHomeVideoBoxCell.h"
#import "JFImageCardView.h"
#import "JFBoxesModel.h"
#import "JFVideosModel.h"
@interface JFHomeVideoBoxCell ()
{
    UILabel *_titleLabel;
    UIImageView *_imageView;
    JFImageCardView *_cardView1;
    JFImageCardView *_cardView2;
    JFImageCardView *_cardView3;
    JFImageCardView *_cardView4;
    JFImageCardView *_cardView5;
    JFImageCardView *_cardView6;
}

@end

@implementation JFHomeVideoBoxCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *JFHomeVideoBoxCellID = @"JFHomeVideoBoxCell";
    JFHomeVideoBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:JFHomeVideoBoxCellID];
    if (cell == nil) {
        cell = [[JFHomeVideoBoxCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JFHomeVideoBoxCellID  ];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = navigationBarColor;
        [self initViews];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)initViews{
    //背景
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, SCREENWIDTH, 40+230+230)];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    //头
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
    [backView addSubview:headView];
    //
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    [backView addSubview:_imageView];
    //
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 100, 40)];
    _titleLabel.textColor = navigationBarColor;
    [headView addSubview:_titleLabel];
    //
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(5, 38, SCREENWIDTH-10, 1)];
    lineView.backgroundColor = navigationBarColor;
    [backView addSubview:lineView];
    //图
    _cardView1 = [[JFImageCardView alloc] initWithFrame:CGRectMake(0, 40, (SCREENWIDTH-5)/3, 230)];
    _cardView2 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)/3, 40, (SCREENWIDTH-5)/3, 230)];
    _cardView3 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)*2/3, 40, (SCREENWIDTH-5)/3, 230)];
    
    _cardView4 = [[JFImageCardView alloc] initWithFrame:CGRectMake(0, 40+230, (SCREENWIDTH-5)/3, 230)];
    _cardView5 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)/3, 40+230, (SCREENWIDTH-5)/3, 230)];
    _cardView6 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)*2/3, 40+230, (SCREENWIDTH-5)/3, 230)];
    
    [backView addSubview:_cardView1];
    [backView addSubview:_cardView2];
    [backView addSubview:_cardView3];
    [backView addSubview:_cardView4];
    [backView addSubview:_cardView5];
    [backView addSubview:_cardView6];
}

-(void)setBoxes:(JFBoxesModel *)boxes{
    _titleLabel.text = boxes.title;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:boxes.index_page_channel_icon] placeholderImage:nil];
    JFVideosModel *video1 = [JFVideosModel objectWithKeyValues:boxes.videos[0]];
    JFVideosModel *video2 = [JFVideosModel objectWithKeyValues:boxes.videos[1]];
    JFVideosModel *video3 = [JFVideosModel objectWithKeyValues:boxes.videos[2]];
    JFVideosModel *video4 = [JFVideosModel objectWithKeyValues:boxes.videos[3]];
    JFVideosModel *video5 = [JFVideosModel objectWithKeyValues:boxes.videos[4]];
    JFVideosModel *video6 = [JFVideosModel objectWithKeyValues:boxes.videos[5]];
    [_cardView1 setVideo:video1];
    [_cardView2 setVideo:video2];
    [_cardView3 setVideo:video3];
    [_cardView4 setVideo:video4];
    [_cardView5 setVideo:video5];
    [_cardView6 setVideo:video6];
    
}

@end
