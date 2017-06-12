//
//  UIView+LoadNib.m
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/5/3.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import "UIView+LoadNib.h"

@implementation UIView (LoadNib)
+ (instancetype)loadNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}
@end
