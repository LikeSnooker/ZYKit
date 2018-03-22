
//
//  NSArray+Safe.m
//  teacher
//
//  Created by 张雨 on 15/5/15.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
-(id)objectAtIndexSafe:(NSUInteger)index
{
    if( index >= [self count] )
        return nil;
    id value=[self objectAtIndex:index];
    if(value ==[NSNull null])
    {
        return nil;
    }
    return value;
}
@end
