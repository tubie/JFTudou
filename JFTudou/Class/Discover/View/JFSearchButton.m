//
//  JFSearchButton.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#define JFSearchButtonImageRatio 0.2
#import "JFSearchButton.h"



@implementation JFSearchButton

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //字体居中
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        //文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return  self;
}


-(void)setHighlighted:(BOOL)highlighted{
    
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width * JFSearchButtonImageRatio;
    CGFloat imageH = contentRect.size.height ;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat  titleX = contentRect.size.width * JFSearchButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height  ;
    return  CGRectMake(titleX, 0, titleW, titleH);
}

@end
