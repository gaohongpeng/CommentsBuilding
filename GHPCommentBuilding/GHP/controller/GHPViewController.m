//
//  GHPViewController.m
//  GHPCommentBuilding
//
//  Created by 高鸿鹏 on 2017/6/12.
//  Copyright © 2017年 Gaohongpeng. All rights reserved.
//

#import "GHPViewController.h"
#import "YJYCommentsCell.h"
@interface GHPViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mytableView;

@end

@implementation GHPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view from its nib.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 15+15+85+2+5;
    }else if (indexPath.row == 1){
        return  15+15+ 1 * 125+40 +75;
    }else if(indexPath.row == 2){
        return  15+15+ 2 * 125+40 +75;
    }
    else if (indexPath.row == 3) {
        return  15+15+ 8 * 125+40 +75;
    }else if (indexPath.row == 4){
        return  15+15+ 3 * 125+40 +75 +70;  //楼层折叠时 显示4层
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
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    YJYCommentsCell *cell = (YJYCommentsCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [YJYCommentsCell loadNib];
    }
    
    if (indexPath.row == 1) {
        [cell FloorShow:1];
    }else if (indexPath.row == 2){
        [cell FloorShow:2];
    }else if (indexPath.row == 3){
        [cell FloorShow:8];
    }else if (indexPath.row == 4){
        [cell FloorFolding];
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
