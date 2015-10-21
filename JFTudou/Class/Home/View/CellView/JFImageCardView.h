//
//  JFImageCardView.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/15.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFVideosModel;
@class JFImageCardView;
@protocol JFImageCardViewDelegate <NSObject>

@optional
-(void)didSelectImageCard:(JFImageCardView *)imageCard video:(JFVideosModel *)video;

@end

@interface JFImageCardView : UIView


@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *pvLabel;
@property(nonatomic, strong) UILabel *yaofengLabel;


-(id)initWithFrame:(CGRect)frame video:(JFVideosModel *)video;

@property(nonatomic, strong) JFVideosModel *video;
@property(nonatomic, weak) id <JFImageCardViewDelegate>delegate;

@end
