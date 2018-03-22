//
//  NSDictionary+ZY.m
//  Client
//
//  Created by lx on 14-10-21.
//  Copyright (c) 2014年 zy. All rights reserved.
//

#import "NSDictionary+ZY.h"

@implementation NSDictionary (ZY)
-(id)ZY_objectForKey:(NSString*)key
{
    if([self objectForKey:key]==nil)
    {
        id result=[self objectForKey:[NSString stringWithFormat:@"%@%@",key,@"s"]];
        if(result != nil)
        {
            if([result isKindOfClass:[NSArray class]])
            {
                return [result objectAtIndex:0];
            }
        }
        else
        {
            return nil;
        }
        
    }

    return [self objectForKey:key];
}
@end
