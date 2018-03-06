//
//  FriendModel.m
//  SKTBCustomCellHeightDemo
//
//  Created by AY on 2018/3/6.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{

	_content = keyedValues[@"contents"];
	_imgArray = keyedValues[@"imgs"];
	[super setValuesForKeysWithDictionary:keyedValues];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
	
}

@end
