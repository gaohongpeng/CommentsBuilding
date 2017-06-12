//
//  YJYCommentsCell.h
//  MedicalEducation
//
//  Created by 高鸿鹏 on 2017/6/9.
//  Copyright © 2017年 YiJiaoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJYCommentsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImage;
@property (weak, nonatomic) IBOutlet UIButton *username;
@property (weak, nonatomic) IBOutlet UILabel *userFrom;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *zanNumber;
@property (weak, nonatomic) IBOutlet UILabel *line;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentTopToFrom;

//有多少层展示多少层
- (void)setView;
//最多展示五层
- (void)FloorShow:(NSInteger)floorCount;
//楼层大于5 楼层折叠时
- (void)FloorFolding;
@end
