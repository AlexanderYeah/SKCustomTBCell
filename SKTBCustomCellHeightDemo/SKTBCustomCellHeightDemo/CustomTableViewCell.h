//
//  CustomTableViewCell.h
//  SKTBCustomCellHeightDemo
//
//  Created by AY on 2018/3/6.
//  Copyright © 2018年 AY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendModel;
@interface CustomTableViewCell : UITableViewCell

/** 内容 */
@property (nonatomic,strong)UILabel *contentLbl;

/** 配图 */
@property (nonatomic,strong)UIImageView *photoImgView;


/** 数据模型 */
@property (nonatomic,strong)FriendModel *model;

/** 在cell中算出高度 创建cell的时候直接进行显示 */
@property (nonatomic,assign)CGFloat cellHeight;


@end
