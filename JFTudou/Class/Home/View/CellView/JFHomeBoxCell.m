//
//  JFHomeBoxCell.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/15.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFHomeBoxCell.h"
#import "JFImageCardView.h"
#import "JFBoxesModel.h"
#import "JFVideosModel.h"
@interface JFHomeBoxCell ()<JFImageCardViewDelegate>
{
    UILabel *_titleLabel;
    UIImageView *_imageView;
    JFImageCardView *_cardView1;
    JFImageCardView *_cardView2;
    JFImageCardView *_cardView3;
    JFImageCardView *_cardView4;
    
}

@end



@implementation JFHomeBoxCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *menuID = @"JFHomeBoxCell";
    JFHomeBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    if (cell == nil) {
        cell = [[JFHomeBoxCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID  ];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
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
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, SCREENWIDTH, 40+300)];
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
    _cardView1 = [[JFImageCardView alloc] initWithFrame:CGRectMake(0, 40, (SCREENWIDTH-5)/2, 150)];
    _cardView2 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)/2, 40, (SCREENWIDTH-5)/2, 150)];
    _cardView3 = [[JFImageCardView alloc] initWithFrame:CGRectMake(0, 40+150, (SCREENWIDTH-5)/2, 150)];
    _cardView4 = [[JFImageCardView alloc] initWithFrame:CGRectMake((SCREENWIDTH-5)/2, 40+150, (SCREENWIDTH-5)/2, 150)];
    _cardView1.tag = 100;
    _cardView2.tag = 101;
    _cardView3.tag = 102;
    _cardView4.tag = 103;
    _cardView1.delegate = self;
    _cardView2.delegate = self;
    _cardView3.delegate = self;
    _cardView4.delegate = self;
    [backView addSubview:_cardView1];
    [backView addSubview:_cardView2];
    [backView addSubview:_cardView3];
    [backView addSubview:_cardView4];
}

-(void)setBoxes:(JFBoxesModel *)boxes{
    _titleLabel.text = boxes.title;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:boxes.index_page_channel_icon] placeholderImage:nil];
    JFVideosModel *video1 = [JFVideosModel objectWithKeyValues:boxes.videos[0]];
    JFVideosModel *video2 = [JFVideosModel objectWithKeyValues:boxes.videos[1]];
    JFVideosModel *video3 = [JFVideosModel objectWithKeyValues:boxes.videos[2]];
    JFVideosModel *video4 = [JFVideosModel objectWithKeyValues:boxes.videos[3]];
    //    [_cardView1 setVideo:video1];
    _cardView1.video = video1;
    [_cardView2 setVideo:video2];
    [_cardView3 setVideo:video3];
    [_cardView4 setVideo:video4];
}

#pragma mark - JFImageCardViewDelegate
-(void)didSelectImageCard:(JFImageCardView *)imageCard video:(JFVideosModel *)video{
    if ([self.delegate respondsToSelector:@selector(didSelectHomeBox:)]) {
        [self.delegate didSelectHomeBox:video];
    }
    
}


@end
