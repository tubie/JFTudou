//
//  JFSubImageScrollView.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFSubScribeCardView,JFSubItemModel;


@protocol JFSubImageScrollViewDelegate <NSObject>


@optional
-(void)didSelectSubScrollView:(JFSubScribeCardView *)subScrollView subItem:(JFSubItemModel *)subItem;

@end

@interface JFSubImageScrollView : UIView

@property(nonatomic, weak) id <JFSubImageScrollViewDelegate>delegate;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSArray *dataArray;


@end
