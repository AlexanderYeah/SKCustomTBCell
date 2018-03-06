//
//  ViewController.m
//  SKTBCustomCellHeightDemo
//
//  Created by AY on 2018/3/1.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"
#import "FriendModel.h"
#import "CustomTableViewCell.h"


/** 设置宽高 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 背景 tableview */
@property (nonatomic,strong)UITableView *mainTableView;
/** 好友圈数组 */
@property (nonatomic,strong)NSMutableArray *friendCircleArr;

@end

@implementation ViewController

#pragma mark - 0 Lazyload
- (NSMutableArray *)friendCircleArr
{
	if (!_friendCircleArr) {
	
		_friendCircleArr = [NSMutableArray arrayWithCapacity:0];
		
		NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
		
		NSData *data = [NSData dataWithContentsOfFile:path];
		

		
	
		NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
		NSArray *dataArr = dic[@"items"];
		
		for (NSDictionary *dic in dataArr) {
			FriendModel *model = [[FriendModel alloc]init];
			[model setValuesForKeysWithDictionary:dic];
			[_friendCircleArr addObject:model];
		}
		
		
	}
	return _friendCircleArr;
	
}


#pragma mark - 1 LifeCycle
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self createMainTB];

}
#pragma mark - 2 Create UI
- (void)createMainTB
{
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.mainTableView.showsVerticalScrollIndicator = NO;
	self.mainTableView.separatorStyle = UITableViewCellSelectionStyleBlue;
	
    [self.view addSubview:self.mainTableView];

}
#pragma mark - 3 Load Data

#pragma mark - 4 Delegate Method 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

	return self.friendCircleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
	
	[cell setModel:self.friendCircleArr[indexPath.row]];
    return cell;

}

// 预估cell的高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

// cell 的真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	        
	CustomTableViewCell * cell = [[CustomTableViewCell alloc]init];
	FriendModel *model = self.friendCircleArr[indexPath.row];
	[cell setModel:model];

	return cell.cellHeight;
	
}


#pragma mark - 5 Action Responese

#pragma mark - 6 Extract Method

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
