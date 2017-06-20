//
//  YJYCommentsTool.m
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/14.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import "YJYCommentsTool.h"


@implementation YJYCommentsTool
//17号子
#define line_height  20.287109
//15号子
//#define line_height  17.900391

//获取评论内容高度
+ (CGFloat )getHeightWithString:(NSString *)string backWidth:(CGFloat)width{
    UILabel *contentLab = [[UILabel alloc]init];
    contentLab.frame = CGRectMake(0, 0, width-15-30-10, 0);
    contentLab.attributedText = [self withString:string];
    contentLab.font = [UIFont systemFontOfSize:17];
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
    [attrstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, string.length)];
    return attrstring;
}
//大于7行折叠成5行 并返回5行时黄色框的高度
+ (CGFloat)setFlodheight:(CGFloat)box_H{
    CGFloat textH = box_H - 105;
    CGFloat lineHeight = line_height +8;
    NSInteger lineCount = textH / lineHeight + 1;
    
    if (lineCount > 7) {
        return 5 * lineHeight +105 +15 +20;
    }else{
        return box_H;
    }
}

+ (CGFloat)setFlodContentheight:(CGFloat)content_H{
    CGFloat textH = content_H;
    CGFloat lineHeight = line_height +8;
    NSInteger lineCount = textH / lineHeight + 1;
    
    if (lineCount > 7) {
        return 5 * lineHeight;
    }else{
        return content_H;
    }
}

+(BOOL)MorethanSevenline:(CGFloat)content_H{
    CGFloat textH = content_H;
    CGFloat lineHeight = line_height +8;
    NSInteger lineCount = textH / lineHeight + 1;
    
    if (lineCount > 7) {
        return YES;
    }else{
        return NO;
    }

}

@end
