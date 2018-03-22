//
//  NSDateExt.h
//  teacher
//
//  Created by 张雨 on 15/4/17.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import<UIKit/UIKit.h>

@interface NSDate(heyha)
+(NSDate*)dateWithLongValue:(long)lvalue;
+(long   )getLongByDate    :(NSDate*)date;
+(NSString*)getDateStringWithFormatter:(NSString *)formatter withDate:(NSDate*)date;
+(NSArray *)getComponetArrWithDate:(NSDate*)date;
@end