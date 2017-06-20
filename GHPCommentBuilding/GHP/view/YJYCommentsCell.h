//
//  YJYCommentsCell.h
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/9.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commentsDataModels.h"
//黄色框里的展开收起
typedef void(^boxCommentPakeUp)(NSInteger index);
//展开收起
typedef void(^commentPakeUp)();
//刷新table
typedef void(^floorUp)();

@interface YJYCommentsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImage;
@property (weak, nonatomic) IBOutlet UIButton *username;
@property (weak, nonatomic) IBOutlet UILabel *userFrom;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *zanNumber;
@property (weak, nonatomic) IBOutlet UILabel *line;
@property (weak, nonatomic) IBOutlet UIButton *flodBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentTopToFrom;

//有多少层展示多少层
- (void)setView;
//最多展示五层
- (void)FloorShow:(NSArray *)reply;
//楼层大于5 楼层折叠时
- (void)FloorFolding:(NSArray *)reply;

@property (nonatomic,copy)boxCommentPakeUp boxpakeUp;

@property (nonatomic,copy)commentPakeUp pakeUp;

@property (nonatomic,copy)floorUp floorup;

@property (nonatomic,assign) BOOL showUp;  //查看全部

@property (nonatomic,assign) BOOL showFloor;   //看错全部楼层


@end
