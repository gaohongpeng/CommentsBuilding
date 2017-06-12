//
//  YJYComments.h
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/9.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJYComments : UIView
@property (nonatomic,strong) UILabel *floor;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UIButton *nameBtn;
@property (nonatomic,strong) UILabel *from;
@property (nonatomic,strong) UIButton *zanBtn;
@property (nonatomic,strong) UILabel *zanNumber;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UIButton *contentBtn;

@property (nonatomic,assign) CGFloat toTop;  //楼层\用户名称 距离边框的上边距

@end
