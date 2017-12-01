//
//  NSDate+NHExtension.h
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NHExtension)

+ (NSString *)timeDescriptionOfTimeInterval:(NSTimeInterval)timeInterval;

+ (NSString *)startTimeWithTimeInterval:(NSTimeInterval)timeInterval;

//判定当前的时间段
+(NSString *)compareDate:(NSDate *)date;

@end
