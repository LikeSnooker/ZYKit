//
//  NSObject+Util.h
//  teacher
//
//  Created by 张雨 on 15/5/15.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Util)
+(BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError**)error;
@end
