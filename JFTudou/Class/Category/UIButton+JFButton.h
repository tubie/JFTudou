//
//  UIButton+JFButton.h
//  JFTudou
//
//  Created by 保修一站通 on 15/10/19.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JFButton)

+ (UIButton *)initBtnWithFrame:(CGRect)frame target:(id)target method:(SEL)method title:(NSString *)title setimageName:(NSString *)setimageName backImageName:(NSString *)backImageName;


@end
