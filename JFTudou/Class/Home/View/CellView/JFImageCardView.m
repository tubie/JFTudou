//
//  JFImageCardView.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/15.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFImageCardView.h"
#import "JFVideosModel.h"
@implementation JFImageCardView



-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-5, frame.size.height-45)];
        //        [self.imageView sd_setImageWithURL:[NSURL URLWithString:video.small_img] placeholderImage:[UIImage imageNamed:@"tudoulogo"]];
        [self addSubview:self.imageView];
        //
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height-40, frame.size.width-5, 20)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        //        self.titleLabel.text = video.title;
        [self addSubview:self.titleLabel];
        //
        self.pvLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height-20, frame.size.width-5, 20)];
        self.pvLabel.font = [UIFont systemFontOfSize:11];
        self.pvLabel.textColor = [UIColor lightGrayColor];
        //        self.pvLabel.text = video.pv;
        [self addSubview:self.pvLabel];
        //
        self.yaofengLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height-60, frame.size.width-10, 20)];
        self.yaofengLabel.font = [UIFont systemFontOfSize:11];
        self.yaofengLabel.textColor = [UIColor whiteColor];
        //        self.yaofengLabel.text = video.yaofeng;
        [self addSubview:self.yaofengLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapImageCard:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame video:(JFVideosModel *)video{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-5, frame.size.height-45)];
        //        [self.imageView sd_setImageWithURL:[NSURL URLWithString:video.small_img] placeholderImage:[UIImage imageNamed:@"tudoulogo"]];
        [self addSubview:self.imageView];
        //
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height-40, frame.size.width-5, 20)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        //        self.titleLabel.text = video.title;
        [self addSubview:self.titleLabel];
        //
        self.pvLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.size.height-20, frame.size.width-5, 20)];
        self.pvLabel.font = [UIFont systemFontOfSize:11];
        self.pvLabel.textColor = [UIColor lightGrayColor];
        //        self.pvLabel.text = video.pv;
        [self addSubview:self.pvLabel];
        //
        self.yaofengLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height-60, frame.size.width-10, 20)];
        self.yaofengLabel.font = [UIFont systemFontOfSize:11];
        self.yaofengLabel.textColor = [UIColor whiteColor];
        //        self.yaofengLabel.text = video.yaofeng;
        [self addSubview:self.yaofengLabel];
    }
    return self;
}

-(void)setVideo:(JFVideosModel *)video{
    _video = video;//这里不能用self.video,只能用_video
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:video.small_img] placeholderImage:[UIImage imageNamed:@"rec_holder"]];
    self.titleLabel.text = video.title;
    if([video.type isEqualToString:@"playlist"]){
        self.pvLabel.text = video.pv;
        if ([video.yaofeng isEqualToString:@""]) {
            self.yaofengLabel.text = video.stripe_b_r;
        }else{
            self.yaofengLabel.text = video.yaofeng;
        }
    }else{
        if ([video.short_desc isEqualToString:@""]) {
            self.pvLabel.text = video.pv;
        }else{
            self.pvLabel.text = video.short_desc;
        }
        self.yaofengLabel.text = video.stripe_b_r;
    }
    
}

-(void)OnTapImageCard:(UITapGestureRecognizer *)sender{
    NSLog(@"video==%@",self.video);
    if ([self.delegate respondsToSelector:@selector(didSelectImageCard:video:)]) {
        [self.delegate didSelectImageCard:self video:self.video];

    }
}



@end
