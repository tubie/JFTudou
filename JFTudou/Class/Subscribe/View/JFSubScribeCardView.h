//
//  JFSubScribeCardView.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFSubItemModel,JFSubScribeCardView;

@protocol JFSubScribeCardViewDelegate <NSObject>

-(void)didSelectSubImageCard:(JFSubScribeCardView *)subImageCard subItem:(JFSubItemModel *)subItem;

@end
@interface JFSubScribeCardView : UIView

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;
@property(nonatomic, strong) JFSubItemModel *subItem;

@property(nonatomic, weak) id<JFSubScribeCardViewDelegate>delegate;

@end
