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
@property (nonatomic,strong) NSMutableArray *bottomArry;
@property (nonatomic,strong) NSMutableArray *topArray;

@end

@implementation GHPViewController
- (NSMutableArray *)topArray{
    if (!_topArray) {
        _topArray = [[NSMutableArray alloc]init];
    }
    return _topArray;
}

- (NSMutableArray *)bottomArry{
    if (!_bottomArry) {
        _bottomArry = [[NSMutableArray alloc]init];
    }
    return _bottomArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    NSFileManager *jsonFile = [[NSFileManager alloc] init];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *createPath = [NSString stringWithFormat:@"%@/json", documentsPath];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [jsonFile createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
    
    NSString *destinationPath = [createPath stringByAppendingPathComponent:@"json.json"];

    
    NSURL *dbURLPath = [NSURL fileURLWithPath:createPath];
    
    void (^copyDb)(void) = ^(void){
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"json"];
        NSAssert1(sourcePath, @"source db does not exist at path %@",sourcePath);
        
        NSError *copyError = nil;
        if( ![jsonFile copyItemAtPath:sourcePath toPath:destinationPath error:&copyError] ) {
            NSLog(@"ERROR | db could not be copied: %@", copyError);
        }
    };
    if([jsonFile fileExistsAtPath:destinationPath] ) {
        [jsonFile removeItemAtPath:destinationPath error:NULL];
        copyDb();
    }
    else if( ![jsonFile fileExistsAtPath:destinationPath] ) {
        NSLog(@"INFO | db file needs copying");
        copyDb();
    }


    [self addSkipBackupAttributeToItemAtURL:dbURLPath];
    
    
    //读取本地json
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
 
    commentsBaseClass *baseClass = [[commentsBaseClass alloc]initWithDictionary:jsonObject];
    
    [self.topArray addObjectsFromArray:baseClass.data.hot];
    
    [self.bottomArry addObjectsFromArray:baseClass.data.timeLine];
    
    [self.mytableView reloadData];
}
- (void)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    //    return success;
}


//本人qq410107098
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    commentsTimeLine *data;
    if (indexPath.section == 0) {
        data = self.topArray[indexPath.row];
    }else{
        data = self.bottomArry[indexPath.row];
    }
    NSInteger floor = data.reply.count;  //楼层数
    
    float box_H = 0.0; //每个黄框的高度
    float width = 0.0;  //黄色背景框的宽
    float height = 0.0;  //最外层框高度
    CGFloat comment_H = 0.0;  //评论内容高度
    
    if (floor > 5 && data.floorUp == NO) {
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        [array addObject:data.reply[0]];
        [array addObject:data.reply[data.reply.count-3]];
        [array addObject:data.reply[data.reply.count-2]];
        [array addObject:data.reply[data.reply.count-1]];
        
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
            
        }
        
        comment_H = [YJYCommentsTool getHeightWithString:data.content backWidth:SCREEN_WIDTH-80+55];
        if (data.commentUp == NO&&[YJYCommentsTool MorethanSevenline:comment_H]) {
            comment_H = [YJYCommentsTool setFlodheight:comment_H+105]-105;
        }else{
            comment_H += 10;
        }
        
        return height + comment_H + 22 +15+75;
        
    }
    
    ///< = 5 层
    //计算出最外层黄色框高度 和 最外层 内容(楼层/名字)上边距
    //黄色框高度 = 105 + 评论内容高度
    CGFloat first = 0.0; //最外面一层的高度
    for (int i = 0 ; i < floor; i++) {
        commentsReply *model = data.reply[i];
        if (i < 4) {
            width = SCREEN_WIDTH - 65- 15 - (i*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
            
            if (i == 0) first = box_H;
            
        }else{
            width = SCREEN_WIDTH - 65- 15 - (4*6);
            
            box_H = [YJYCommentsTool getHeightWithString:model.content backWidth:width] +105;
        }
        
        if (model.commentUp == NO) {
            if ([YJYCommentsTool MorethanSevenline:box_H-105]){
                box_H = [YJYCommentsTool setFlodheight:box_H];
            }
        }
        
        height += box_H;
        
    }
    
    comment_H = [YJYCommentsTool getHeightWithString:data.content backWidth:SCREEN_WIDTH-80+55];
    if (data.commentUp == NO&&[YJYCommentsTool MorethanSevenline:comment_H]) {
        comment_H = [YJYCommentsTool setFlodheight:comment_H+105]-105;
        
    }else{
        comment_H += 10;
    }
    
    if (floor == 0) {
        return height + comment_H + 22 +75;
    }
    return height + comment_H + 22 +15+75;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.topArray.count;
    }
    return self.bottomArry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    YJYCommentsCell *cell = (YJYCommentsCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [YJYCommentsCell loadNib];
    }
    
    commentsTimeLine *model ;
    if (indexPath.section == 0) {
        model = [self.topArray objectAtIndex:indexPath.row];
    }else{
        model = [self.bottomArry objectAtIndex:indexPath.row];
    }
    
    
    cell.boxpakeUp = ^(NSInteger index) {
        commentsReply *reply = model.reply[index];
        reply.commentUp = YES;
        [self.mytableView reloadData];
    };
    
    cell.pakeUp = ^{
        model.commentUp = YES;
        [self.mytableView reloadData];
    };
    
    cell.floorup = ^{
        model.floorUp = YES;
        [self.mytableView reloadData];
    };
    
    if (model.reply.count > 5 && model.floorUp == NO) {
        [cell FloorFolding:model.reply];
        
    }else{
        [cell FloorShow:model.reply];
        
    }
    cell.comment.attributedText = [YJYCommentsTool withString:model.content];
//    [cell.headImage setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:model.avatar]];
    [cell.username setTitle:model.nickname forState:UIControlStateNormal];
    cell.zanNumber.text = model.praiseNum;
    cell.userFrom.text = model.addTime;
    cell.showUp = model.commentUp;
    cell.showFloor = model.floorUp;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, 67, 24)];
//    [btn dk_setBackgroundImage:DKImagePickerWithNames(@"hotdiscuss_mark",@"hotdiscuss_mark_night",@"hotdiscuss_mark") forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [headView addSubview:btn];
    if (section == 0) {
        [btn setTitle:@"热门评论" forState:UIControlStateNormal];
    }else if (section == 1)
    {
        [btn setTitle:@"最新评论" forState:UIControlStateNormal];
    }
//    [btn dk_setTitleColorPicker:DKColorPickerWithKey(WHITECOLOR) forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(2, 0, 0, 0)];
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
