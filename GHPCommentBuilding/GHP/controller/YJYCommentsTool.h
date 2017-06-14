//
//  YJYCommentsTool.h
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/14.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJYCommentsTool : NSObject
//获取评论内容高度
+ (CGFloat )getHeightWithString:(NSString *)string backWidth:(CGFloat)width;
//设置字的行间距
+ (NSMutableAttributedString *)withString:(NSString *)string;
@end
