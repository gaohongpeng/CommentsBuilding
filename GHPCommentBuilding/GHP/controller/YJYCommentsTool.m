//
//  YJYCommentsTool.m
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/14.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import "YJYCommentsTool.h"

@implementation YJYCommentsTool

//获取评论内容高度
+ (CGFloat )getHeightWithString:(NSString *)string backWidth:(CGFloat)width{
    UILabel *contentLab = [[UILabel alloc]init];
    contentLab.frame = CGRectMake(0, 0, width-15-30-10, 0);
    contentLab.attributedText = [self withString:string];
    contentLab.font = [UIFont systemFontOfSize:15];
    contentLab.numberOfLines = 0;
    [contentLab sizeToFit];
    
    return contentLab.bounds.size.height;
}

//设置字的行间距
+ (NSMutableAttributedString *)withString:(NSString *)string
{
    NSMutableAttributedString *attrstring = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [paraStyle setLineSpacing:8.0];
    [attrstring addAttributes:@{NSParagraphStyleAttributeName:paraStyle} range:NSMakeRange(0, string.length)];
    [attrstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, string.length)];
    return attrstring;
}

@end
