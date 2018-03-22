//
//  UserManger.m
//  Parent
//
//  Created by 张雨 on 15/4/29.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import "UserManger.h"

@implementation UserManger

+(id)sharedInstance{
    static id _s;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _s=[[[self class] alloc] init];
    });
    return _s;
}
@end
