//
//  NSDate+NHExtension.m
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NSDate+NHExtension.h"

@implementation NSDate (NHExtension)

+ (NSDateComponents *)componetsWithTimeInterval:(NSTimeInterval)timeInterval
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *dateOne = [NSDate date];
    NSDate *dateTwo = [NSDate dateWithTimeInterval:timeInterval sinceDate:dateOne];
    unsigned int unitFlags = NSSecondCalendarUnit | NSMinuteCalendarUnit | NSHourCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    return [calendar components:unitFlags fromDate:dateOne toDate:dateTwo options:0];
}

+ (NSString *)timeDescriptionOfTimeInterval:(NSTimeInterval)timeInterval
{
    NSDateComponents *components = [[self class] componetsWithTimeInterval:timeInterval];
    return [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)components.hour, (long)components.minute, (long)components.second];
}

+ (NSString *)startTimeWithTimeInterval:(NSTimeInterval)timeInterval{
    
    return [NSString stringWithFormat:@"%@",[[self class] timeDescriptionOfTimeInterval:timeInterval ]];
}

//判定当前的时间段
+(NSString *)compareDate:(NSDate *)date{
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *yesterday, *beforeYesterday;
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    beforeYesterday = [today dateByAddingTimeInterval:-secondsPerDay * 2];
    
    // 10 first characters of description is the calendar date:
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *beforeYesterdayStr = [[beforeYesterday description] substringToIndex:10];
    NSString *dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return [NSString stringWithFormat:@"今天%@",[[date description] substringWithRange:NSMakeRange(10, 6)]];
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return [NSString stringWithFormat:@"昨天%@",[[date description] substringWithRange:NSMakeRange(10, 6)]];
    }else if ([dateString isEqualToString:beforeYesterdayStr])
    {
        return [NSString stringWithFormat:@"前天%@",[[date description] substringWithRange:NSMakeRange(10, 6)]];
    }
    else
    {
        return dateString;
    }
}


@end
