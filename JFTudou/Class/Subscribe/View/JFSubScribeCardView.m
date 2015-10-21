//
//  JFSubScribeCardView.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFSubScribeCardView.h"
#import "JFSubItemModel.h"
@implementation JFSubScribeCardView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, frame.size.width-5, frame.size.height-30)];
        [self addSubview:self.imageView];
        
        //
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height-30, frame.size.width-5, 30)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
//        self.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:self.titleLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapImageCard:)];
        [self addGestureRecognizer:tap];

    }
    return self;
}

-(void)setSubItem:(JFSubItemModel *)subItem{
    _subItem = subItem;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:subItem.picurl] placeholderImage:[UIImage imageNamed:@"rec_holder"]];
    self.titleLabel.text = subItem.title;
//    [self.cardImageView sd_setImageWithURL:[NSURL URLWithString:subItem.picurl]  placeholderImage:[UIImage imageNamed:@"rec_holder"]];
//    self.cardLabel .text = subItem.title;
}

-(void)TapImageCard:(UITapGestureRecognizer *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectSubImageCard:subItem:)]) {
        [self.delegate didSelectSubImageCard:self subItem:self.subItem];
    }
}




@end

