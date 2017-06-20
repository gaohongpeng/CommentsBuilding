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
//大于7行折叠成5行 并返回5行时黄色框的高度
+ (CGFloat)setFlodheight:(CGFloat)box_H;
//大于7行折叠成5行 并返回5行评论的高度
+ (CGFloat)setFlodContentheight:(CGFloat)content_H;
//判断是否大于7行
+(BOOL)MorethanSevenline:(CGFloat)content_H;
@end
