//
//  YJYCommentsCell.m
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/9.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import "YJYCommentsCell.h"
#import "YJYComments.h"
#import "YJYCommentsTool.h"
@implementation YJYCommentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

//此方法不用 这个是一直盖楼 100层楼就有100层边框
- (void)setView{
    
    NSInteger floor_count = 5;
    float width = 0.0;  //黄色背景框的宽
    float height = 125*(floor_count);  //130 是黄框的高度
    float MinY = 85;
    float toTopY = (floor_count-1) * 130 +20;
    for (int i = 0; i < floor_count; i++) {
        width = SCREEN_WIDTH - 65- 15 - (i*6);
        YJYComments *comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+i*3, MinY, width, height)];
        comment.toTop = toTopY;
        comment.floor.text = [NSString stringWithFormat:@"%ld",floor_count-i];
        [self addSubview:comment];
        MinY += 3;
        height -= 130;
        toTopY -= 130;
    }
    
    self.commentTopToFrom.constant = 15+15+ floor_count * 130;
}

//如果count > 5 最多显示5层
- (void)FloorShow:(NSInteger)floorCount{
    
    NSArray *array = @[@"❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..........❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!$&!&%!$%^%!^G**!&!!*@$(!&$GBDH!*^*!$B",@"测试测试测试测试测试测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"];
    
    NSInteger floor = floorCount;  //楼层数
    
    float box_H = 0.0; //每个黄框的高度
    float width = 0.0;  //黄色背景框的宽
    float height = 0.0;  //最外层框高度
    float MinY = 85;
    float toTopY = 20;
    
    //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
    //黄色框高度 = 105 + 评论内容高度
    CGFloat first = 0.0; //最外面一层的高度
    for (int i = 0 ; i < floor; i++) {
        
        if (i < 4) {
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
            
            if (i == 0) first = box_H;
            
        }else{
            width = SCREEN_WIDTH - 65- 15 - (4*6);
            
            box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
        }
        
        height += box_H;
        
        if (i == floor-1) {
            toTopY = height - first+20; //最外层楼层的上边距
        }
    }
    
    self.commentTopToFrom.constant = 15+15+ height;
    
    for (int i = 0; i < floor; i++) {
        
        CGFloat distance = 0.0;
        YJYComments *comment;
        if (i < 4) { //最外面四层
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
            
            comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+i*3, MinY, width, height)];
            
            MinY += 3;
            
        }else{
            width = SCREEN_WIDTH - 65- 15 - (4*6);
            
            box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
            
            comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+4*3, MinY, width, height)];
            
        }
        
        if (i+1 != floor) {
            distance = [YJYCommentsTool getHeightWithString:array[i+1] backWidth:width] +105;
        }
        
        comment.content.attributedText = [YJYCommentsTool withString:array[i]];
        comment.toTop = toTopY;
        comment.floor.text = [NSString stringWithFormat:@"%ld",floor-i];
        [self addSubview:comment];
        
        height -= box_H;
        
        toTopY = toTopY-distance;
        
    }
    
}


//楼层大于5 楼层折叠
- (void)FloorFolding{
    
    NSArray *array = @[@"测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..........!!!!@@#@$%$^%&$%*$",@"测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试测试测试测试测试测试测试试测试测试测试测试测试测试测测试测试测试测试",@"测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!!@#!@$!@#%^$%^&$%*^(&(^$##$@@@!#!#$%^试测试测试测试测试测试测试测试测试",@"测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..//???fkahf",@"测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试"];
    
    
    float box_H = 0.0; //每个黄框的高度
    float width = 0.0;  //黄色背景框的宽
    float height = 0.0;  //最外层框高度
    float MinY = 85;
    float toTopY = 0.0;
    
    //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
    CGFloat first = 0.0; //最外面一层的高度
    for (int i = 0 ; i < 4; i++) {
        
        width = SCREEN_WIDTH - 65- 15 - (i*6);
        
        box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
        
        if (i == 1) box_H = 70;
        
        if (i == 0) first = box_H;
        
        height += box_H;
        
        if (i == 4-1) {
            toTopY = height - first+20; //最外层楼层的上边距
        }
    }
    
    self.commentTopToFrom.constant = 15+15+ height;
    
    for (int i = 0 ; i < 4; i++) {
        width = SCREEN_WIDTH - 65- 15 - (i*6);
        box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
        if (i == 1) box_H = 70;
        //创建黄色框
        YJYComments *comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+i*3, MinY, width, height)];
        comment.content.attributedText = [YJYCommentsTool withString:array[i]];
        if (i == 1) {
            comment.content.text = @"展开隐藏楼层   ";
            comment.content.font = [UIFont systemFontOfSize:17];
            comment.content.textColor = [UIColor grayColor];
            comment.content.textAlignment = NSTextAlignmentCenter;
            comment.floor.hidden = comment.name.hidden = comment.from.hidden = comment.zanBtn.hidden = comment.zanNumber.hidden = YES;
        }
        comment.toTop = toTopY;
        comment.floor.text = [NSString stringWithFormat:@"%d",4-i];
        [self addSubview:comment];
        
        CGFloat distance = 0.0;
        if (i+1 != 4) {
            distance = [YJYCommentsTool getHeightWithString:array[i+1] backWidth:width] +105;
            if (i == 0) {
                distance = 70+50;
            }else if (i == 1){
                distance -= 50;
            }
        }
        
        MinY += 3;
        height -= box_H;
        toTopY -= distance;
    }
    
}

- (IBAction)ClickHeadImage:(id)sender {
}
- (IBAction)ClickUserName:(id)sender {
}
- (IBAction)ClickComment:(id)sender {
}
- (IBAction)ClickZanBtn:(id)sender {
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
