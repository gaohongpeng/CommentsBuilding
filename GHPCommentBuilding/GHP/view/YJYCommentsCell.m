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
@interface YJYCommentsCell ()<CommentsViewDelegate>

@end
@implementation YJYCommentsCell
@synthesize boxpakeUp;
@synthesize pakeUp;
@synthesize floorup;
@synthesize showUp;
@synthesize showFloor;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.showUp = NO;
    self.showFloor = NO;
    
    [_flodBtn setTitle:@"查看全部" forState:UIControlStateNormal];
    _flodBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_flodBtn setTitleColor:RRR(100) forState:UIControlStateNormal];
    _flodBtn.layer.masksToBounds = YES;
    _flodBtn.layer.borderColor = LINE_COLOR.CGColor;
    _flodBtn.layer.borderWidth = 0.5;
    _flodBtn.layer.cornerRadius = 10;
    [_flodBtn setImage:[UIImage imageNamed:@"xjt"] forState:UIControlStateNormal];
    [_flodBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
    [_flodBtn setImageEdgeInsets:UIEdgeInsetsMake(9, 64, 7, 8)];
    _flodBtn.hidden = YES;
    
    // Initialization code
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.comment sizeToFit];
    float comment_H = [YJYCommentsTool getHeightWithString:self.comment.text backWidth:SCREEN_WIDTH-80+55];
    
    if (self.showUp == NO && [YJYCommentsTool MorethanSevenline:comment_H]) {
        self.comment.numberOfLines = 5;
        float content_H = [YJYCommentsTool setFlodContentheight:self.comment.bounds.size.height] ;
        CGRect frame = self.comment.frame;
        frame.size.height = content_H;
        self.comment.frame = frame;
        _flodBtn.hidden = NO;
    }else{
        self.comment.numberOfLines = 0;
        [self.comment sizeToFit];
    }
//    self.comment.lineBreakMode = NSLineBreakByTruncatingTail;

}
- (IBAction)pakeUp:(id)sender {
    if(self.showUp){
        self.showUp = NO;
    }else{
        self.showUp = YES;
        self.comment.numberOfLines = 0;
        [self.comment sizeToFit];
        _flodBtn.hidden = YES;
        self.pakeUp();
    }
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
- (void)FloorShow:(NSArray *)reply{
    
    NSInteger floor = reply.count;  //楼层数
    
    float box_H = 0.0; //每个黄框的高度
    float width = 0.0;  //黄色背景框的宽
    float height = 0.0;  //最外层框高度
    float MinY = 85;
    float toTopY = 20;
    
    //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
    //黄色框高度 = 105 + 评论内容高度
    CGFloat first = 0.0; //最外面一层的高度
    for (int i = 0 ; i < floor; i++) {
        commentsReply *model = reply[i];
        if (i < 4) {
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
            
            if (i == 0) {
                first = box_H;
                if (model.commentUp == NO) {
                    first = [YJYCommentsTool setFlodheight:first];
                }
            }
            
        }else{
            width = SCREEN_WIDTH - 65- 15 - (4*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
        }
        
        //判断是否大于7行
        if (model.commentUp == NO){ //收起状态
            if ([YJYCommentsTool MorethanSevenline:box_H-105]){
                box_H = [YJYCommentsTool setFlodheight:box_H];
            }
        }
        
        height += box_H;
        
        if (i == floor-1) {
            toTopY = height - first+20; //最外层楼层的上边距
        }
    }
    if (floor > 0) {
        self.commentTopToFrom.constant = 15+15+ height;

    }

    for (int i = 0; i < floor; i++) {
        commentsReply *model = reply[i];

        CGFloat distance = 0.0;
        YJYComments *comment;
        if (i <= 4) { //最外面四层
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
            //折叠
            if ([YJYCommentsTool MorethanSevenline:box_H-105] && model.commentUp == NO){
                box_H = [YJYCommentsTool setFlodheight:box_H];
            }
            
            comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+i*3, MinY, width, height)];
            
            MinY += 3;
            
        }else{
            width = SCREEN_WIDTH - 65- 15 - (4*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
            //折叠
            if ([YJYCommentsTool MorethanSevenline:box_H-105] && model.commentUp == NO){
                box_H = [YJYCommentsTool setFlodheight:box_H];
            }
            
            comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+4*3, MinY, width, height)];
            
        }
        
        if (i+1 != floor) {
            commentsReply *upmodel = reply[i+1];
            if (i+1 <= 4) { //最外面四层
                width = SCREEN_WIDTH - 65- 15 - ((i+1)*6);
            }else{
                width = SCREEN_WIDTH - 65- 15 - (4*6);
            }

            distance = [YJYCommentsTool getHeightWithString:upmodel.content backWidth:width] +105;
            
            //判断是否大于7行
            if (upmodel.commentUp == NO) {
                distance = [YJYCommentsTool setFlodheight:distance];
            }

        }
        
        comment.delegate = self;
        comment.index = i;
        comment.content.attributedText = [YJYCommentsTool withString:model.content];
        comment.showAll = model.commentUp;
        comment.toTop = toTopY;
        comment.floor.text = [NSString stringWithFormat:@"%@",model.floorNum];
        [comment.floor adjustsFontSizeToFitWidth];
        comment.name.text = model.nickname;
        comment.from.text = model.addTime;
        comment.zanNumber.text = model.praiseNum;
        [self addSubview:comment];
        NSLog(@"%f",comment.content.font.lineHeight);
        
        comment.commentup = ^{
            model.commentUp = YES;  //展开
            self.boxpakeUp(i);
        };
        
        
        height -= box_H;
        toTopY -= distance;
        
        
    }
    
}


//楼层大于5 楼层折叠
- (void)FloorFolding:(NSArray *)reply{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:reply[0]];
    [array addObject:reply[reply.count-3]];
    [array addObject:reply[reply.count-2]];
    [array addObject:reply[reply.count-1]];

    float box_H = 0.0; //每个黄框的高度
    float width = 0.0;  //黄色背景框的宽
    float height = 0.0;  //最外层框高度
    float MinY = 85;
    float toTopY = 0.0;
    
    //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
    CGFloat first = 0.0; //最外面一层的高度
    for (int i = 0 ; i < 4; i++) {
        commentsReply *model = array[i];
        
        width = SCREEN_WIDTH - 65- 15 - (i*6);
        
        box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
        
        //折叠
        if ([YJYCommentsTool MorethanSevenline:box_H-105] && model.commentUp == NO){
            box_H = [YJYCommentsTool setFlodheight:box_H];
        }
        
        if (i == 1) box_H = 70;

        if (i == 0) {
            first = box_H;
            if (model.commentUp == NO) {
                first = [YJYCommentsTool setFlodheight:first];
            }
        }
        
        height += box_H;
        
        if (i == 4-1) {
            toTopY = height - first+20; //最外层楼层的上边距
        }
    }
    
    if (reply.count > 0) {
        self.commentTopToFrom.constant = 15+15+ height;
    }

    for (int i = 0 ; i < 4; i++) {
        commentsReply *model = array[i];

        width = SCREEN_WIDTH - 65- 15 - (i*6);
        box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
        //折叠
        if ([YJYCommentsTool MorethanSevenline:box_H-105] && model.commentUp == NO){
            box_H = [YJYCommentsTool setFlodheight:box_H];
        }

        if (i == 1) box_H = 70;
        //创建黄色框
        YJYComments *comment = [[YJYComments alloc]initWithFrame: CGRectMake(65+i*3, MinY, width, height)];
        comment.delegate = self;
        comment.index = i;
        comment.content.attributedText = [YJYCommentsTool withString:model.content];
        comment.showAll = model.commentUp;
        comment.toTop = toTopY;
        comment.floor.text = [NSString stringWithFormat:@"%@",model.floorNum];
        [comment.floor adjustsFontSizeToFitWidth];
        comment.name.text = model.nickname;
        comment.from.text = model.addTime;
        comment.zanNumber.text = model.praiseNum;
        if (i == 1) {
            comment.content.attributedText = nil;
            comment.content.text = @"           展开隐藏楼层";
            comment.content.font = [UIFont systemFontOfSize:19];
            comment.content.textColor = [UIColor grayColor];
            comment.content.textAlignment = NSTextAlignmentCenter;
            comment.floor.hidden = comment.name.hidden = comment.from.hidden = comment.zanBtn.hidden = comment.zanNumber.hidden = YES;
        }
        
        comment.commentup = ^{
            model.commentUp = YES;  //展开
            self.boxpakeUp(i);
        };
        
        [self addSubview:comment];
        
        CGFloat distance = 0.0;
        if (i+1 != 4) {
            commentsReply *upmodel = array[i+1];
            width = SCREEN_WIDTH - 65- 15 - ((i+1)*6);
            distance = [YJYCommentsTool getHeightWithString:upmodel.content backWidth:width] +105;
            //判断是否大于7行
            if (upmodel.commentUp == NO) {
                distance = [YJYCommentsTool setFlodheight:distance];
            }
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

- (void)clickcomments:(NSInteger)index{
    if (self.showFloor) {
        
    }else{
        if (index == 1) {
            self.showFloor = YES;
            self.floorup();
        }
    }
}

- (IBAction)ClickHeadImage:(id)sender {
}
- (IBAction)ClickUserName:(id)sender {
}
- (IBAction)ClickComment:(id)sender {
    
    [self.comment setBackgroundColor:RRR(230)];
    [self performSelector:@selector(buttonNormal:) withObject:sender afterDelay:0.2];

}
- (IBAction)ClickZanBtn:(id)sender {
}

- (void)buttonNormal:(UIButton *)sender{
    self.comment.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
