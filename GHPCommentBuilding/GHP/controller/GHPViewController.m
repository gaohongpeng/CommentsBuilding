//
//  GHPViewController.m
//  GHPCommentBuilding
//
//  Created by 高鸿鹏 on 2017/6/12.
//  Copyright © 2017年 Gaohongpeng. All rights reserved.
//  QQ:410107098

#import "GHPViewController.h"
#import "YJYCommentsCell.h"
#import "YJYCommentsTool.h"
@interface GHPViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mytableView;

@end

@implementation GHPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view from its nib.
}


//本人qq410107098
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSArray *array = @[@"❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..........❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!$&!&%!$%^%!^G**!&!!*@$(!&$GBDH!*^*!$B",@"测试测试测试测试测试测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"];
        NSInteger floor = 8;  //楼层数
        
        float box_H = 0.0; //每个黄框的高度
        float width = 0.0;  //黄色背景框的宽
        float height = 0.0;  //最外层框高度
        
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
            
        }
        return height + 30 + 22 +15+75;
    }else if (indexPath.row == 1){
        
        NSArray *array = @[@"测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..........!!!!@@#@$%$^%&$%*$",@"测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!试测试测试测试测试测试测试试测试测试测试测试测试测试测测试测试测试测试",@"测试测试测试测❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!!@#!@$!@#%^$%^&$%*^(&(^$##$@@@!#!#$%^试测试测试测试测试测试测试测试测试",@"测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试..//???fkahf",@"测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试试测试测试测试测试测试测试测试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试测试测试测试测试测试测试测测试测试测试测试测试测试测试测试测试测试❤️🐷🐴🐑🐦^!&@*&%$^@*(!)$!)!$*&!测试测试测试测试测试"];
        float box_H = 0.0; //每个黄框的高度
        float width = 0.0;  //黄色背景框的宽
        float height = 0.0;  //最外层框高度
        
        //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
        CGFloat first = 0.0; //最外面一层的高度
        for (int i = 0 ; i < 4; i++) {
            
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:array[i] backWidth:width] +105;
            
            if (i == 1) box_H = 70;
            
            if (i == 0) first = box_H;
            
            height += box_H;
            
        }
        
        return height + 30 + 22 +15+75;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    YJYCommentsCell *cell = (YJYCommentsCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [YJYCommentsCell loadNib];
    }
    
    if (indexPath.row == 1) {
        [cell FloorFolding];
    }else{
        [cell FloorShow:8];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
