//
//  NSObject+NHExtension.m
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NSObject+NHExtension.h"

@implementation NSObject (NHExtension)

+ (NSMutableAttributedString *)setTextColorWithStr:(NSString *)str Color:(UIColor *)color Range:(NSRange)range{
    
    if (str == nil) return nil;
    
    NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc] initWithString:str];
    [newStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return newStr;
}

+ (NSMutableAttributedString *)setTextFontWithStr:(NSString *)str Font:(UIFont *)font Range:(NSRange)range{
    
    if (str == nil) return nil;
    
    NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc] initWithString:str];
    [newStr addAttribute:NSFontAttributeName value:font range:range];
    
    return newStr;
}

@end
