//
//  JFSubImageScrollView.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFSubImageScrollView.h"
#import "JFSubScribeCardView.h"
#import "JFSubItemModel.h"

@interface JFSubImageScrollView ()<JFSubScribeCardViewDelegate>

@end
@implementation JFSubImageScrollView

-(JFSubImageScrollView*)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.contentSize = CGSizeMake(2*SCREENWIDTH, frame.size.height);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        //card
        float cardWidth = (SCREENWIDTH*2-15)/3;
        
        for (int i = 0; i < 3; i++) {
            JFSubScribeCardView *card = [[JFSubScribeCardView alloc] initWithFrame:CGRectMake(cardWidth*i, 0, cardWidth, frame.size.height)];
           // JFSubScribeCardView *card = [UIView viewWithXibName:@"JFSubScribeCardView"];
            card.frame = CGRectMake((cardWidth+5)*i +5, 0, cardWidth, frame.size.height);
            card.tag = 20+i;
            [self.scrollView addSubview:card];
            card.delegate = self;
        }
    }
    return self;
}

-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    for (int i = 0; i < 3; i++) {
        JFSubItemModel *item = dataArray[i];
        JFSubScribeCardView *card = (JFSubScribeCardView *)[self.scrollView viewWithTag:20+i];
        [card setSubItem:item];
    }
}

-(void)didSelectSubImageCard:(JFSubScribeCardView *)subImageCard subItem:(JFSubItemModel *)subItem{
    if ([self.delegate respondsToSelector:@selector(didSelectSubScrollView:subItem:)]) {
        [self.delegate didSelectSubScrollView:subImageCard subItem:subItem];
    }
}


@end
