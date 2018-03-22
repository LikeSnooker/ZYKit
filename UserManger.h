//
//  UserManger.h
//  Parent
//
//  Created by 张雨 on 15/4/29.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserManger : NSObject
@property(nonatomic,strong)UserModel * modelS;
+(id)sharedInstance;
@end
