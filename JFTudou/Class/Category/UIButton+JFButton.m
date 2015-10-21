//
//  UIButton+JFButton.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "UIButton+JFButton.h"

@implementation UIButton (JFButton)

+ (UIButton *)initBtnWithFrame:(CGRect)frame target:(id)target method:(SEL)method title:(NSString *)title setimageName:(NSString *)setimageName backImageName:(NSString *)backImageName;
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn setImage:[UIImage imageNamed:setimageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
    return btn;
}
@end
