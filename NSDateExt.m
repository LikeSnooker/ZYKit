//
//  NSDateExt.m
//  teacher
//
//  Created by 张雨 on 15/4/17.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import "NSDateExt.h"

@implementation NSDate(heyha)

+(NSDate*)dateWithLongValue:(long)lvalue
{
    long hour=(lvalue-10000)/100;
    long min =lvalue -10000-hour*100;
    NSDate * result=[NSDate dateWithTimeIntervalSince1970:hour*3600+ min*60];
    
    return result;
}
+(long   )getLongByDate    :(NSDate*)date
{
    NSCalendar * calendar=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    long hour = [comps hour];
    long min  = [comps minute];
    return  hour* 100 +min +10000;
}
+(NSString*)getDateStringWithFormatter:(NSString *)formatter withDate:(NSDate*)date;
{
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    
    [outputFormatter setLocale:[NSLocale currentLocale]];
    
    [outputFormatter setDateFormat:formatter];
    
    NSString *str= [outputFormatter stringFromDate:(date==nil?[NSDate date]:date)];
    return str;
}
+(NSArray *)getComponetArrWithDate:(NSDate*)date
{
    NSCalendar * calendar=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    int year =(int)[comps year];
    int month=(int)[comps month];
    int day  =(int)[comps day];
    int hour = (int)[comps hour];
    int min = (int)[comps minute];
    int sec = (int)[comps second];
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:year],[NSNumber numberWithInt:month],[NSNumber numberWithInt:day],[NSNumber numberWithInt:hour],[NSNumber numberWithInt:min],[NSNumber numberWithInt:sec],nil];
}
@end;