//
//  UIView+JFLoadXib.m
//  JFTudou
//
//  Created by 保修一站通 on 15/10/16.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "UIView+JFLoadXib.h"

@implementation UIView (JFLoadXib)

+( id )viewWithXibName:(NSString *)string{
    return   [[[NSBundle mainBundle]loadNibNamed:string owner:nil options:nil]lastObject];
}

@end
