//
//  NSObject+NHExtension.h
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NHExtension)

/**
 *  修改富文本的颜色
 *
 *  @param str   要改变的string
 *  @param color 设置颜色
 *  @param range 设置颜色的文字范围
 *
 *  @return 新的AttributedString
 */
+ (NSMutableAttributedString *)setTextColorWithStr:(NSString *)str Color:(UIColor *)color Range:(NSRange)range;


/**
 *  修改富文本的字体
 *
 *  @param str   要改变的string
 *  @param font  设置字体
 *  @param range 设置字体的文字范围
 *
 *  @return 新的AttributedString
 */
+ (NSMutableAttributedString *)setTextFontWithStr:(NSString *)str Font:(UIFont *)font Range:(NSRange)range;


@end
