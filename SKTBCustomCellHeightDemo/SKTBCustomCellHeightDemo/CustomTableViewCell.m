//
//  CustomTableViewCell.m
//  SKTBCustomCellHeightDemo
//
//  Created by AY on 2018/3/6.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "CustomTableViewCell.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#import "FriendModel.h"
@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self createUI];
	}
	return self;

}

- (void)createUI
{
	
	// 内容
	_contentLbl = [[UILabel alloc]init];

    _contentLbl.textColor = [UIColor blackColor];
    _contentLbl.font = [UIFont systemFontOfSize:15.0f];
    _contentLbl.text = @"Aleaxander is coding,what can i do for you ?";
	_contentLbl.numberOfLines = 0;
    [self.contentView addSubview:_contentLbl];
    _contentLbl.textAlignment = NSTextAlignmentLeft;
    [_contentLbl makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(50);
        make.left.equalTo(self.contentView.left).offset(15);
        make.right.equalTo(self.contentView.right).offset(-15);
        make.top.equalTo(self.top).offset(10);
    }];
	
	
	// 6 照片墙 请求完数据再去计算其大小
    _photoImgView = [[UIImageView alloc]init];
    _photoImgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_photoImgView];
    
    [_photoImgView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentLbl.left);
        make.right.equalTo(_contentLbl.right);
        make.top.equalTo(_contentLbl.bottom).offset(10);
        make.height.equalTo(2);
        
    }];
}

/** 计算 */
- (void)setModel:(FriendModel *)model
{

	_model = model;
	
	// 内容
	
	_contentLbl.text = model.content;
	CGRect contentRect = [model.content boundingRectWithSize:CGSizeMake(kScreenW - 30, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]} context:nil];
    [_contentLbl updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(contentRect.size.height);
    }];
	
	//  图片
    CGFloat img_padding = 10;
    CGFloat img_left_padding = 15;
    CGFloat img_top_padding = 10;
    CGFloat imgWidth = (kScreenW - img_left_padding * 2 - img_padding * 2 ) / 3;
	NSArray *imgArr = model.imgArray;
	
	for (int i = 0; i < imgArr.count; i ++) {
            // 进行图片的布局
            UIImageView *imgview = [[UIImageView alloc]init];
            
            [_photoImgView addSubview:imgview];
            
            CGFloat rows = i / 3;
            CGFloat cols = i % 3;
            
            CGFloat img_x = cols * imgWidth + cols * img_padding;
            CGFloat img_y = rows * imgWidth + rows * img_top_padding;
            imgview.frame = CGRectMake(img_x, img_y, imgWidth, imgWidth);
			imgview.image = [UIImage imageNamed:imgArr[i]];
		
	}
 	[self layoutIfNeeded];
	
	// 更新照片墙的高度 同样的道理，必须有图片才有高度
    CGFloat photo_height = 0;
	
	if (imgArr.count == 0) {
		photo_height = 0;
	}else if(imgArr.count < 3){
		photo_height = (imgArr.count / 3 + 1) * (imgWidth + img_top_padding);
	}else if (imgArr.count == 3){
		photo_height = (imgArr.count / 3) * (imgWidth + img_top_padding);
	}else if (imgArr.count < 6){
		photo_height = (imgArr.count / 3 + 1) * (imgWidth + img_top_padding);
	}else if (imgArr.count == 6){
		photo_height = (imgArr.count / 3) * (imgWidth + img_top_padding);
	}else if (imgArr.count < 9){
		photo_height = (imgArr.count / 3 + 1) * (imgWidth + img_top_padding);
	}else if(imgArr.count == 9){
		photo_height = (imgArr.count / 3) * (imgWidth + img_top_padding);
	}else{
	
	}
	
	
	
	
	
	
	
	

	
    [_photoImgView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(photo_height);
    }];
    
	
	// 计算出cell 的高度 赋值给cellHeight
	// 所有控件的高度累加以及间距
	self.cellHeight = photo_height + contentRect.size.height + 20;
	
	
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
