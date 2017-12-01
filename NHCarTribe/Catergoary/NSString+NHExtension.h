//
//  NSString+NHExtension.h
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NHExtension)


/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGRect)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


/**
 *  判断是否含有表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

@end
