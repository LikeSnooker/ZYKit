//
//  UserModel.h
//  Parent
//
//  Created by 张雨 on 15/4/29.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UserModel : NSObject
@property(nonatomic,strong) NSString * app_id;
@property(nonatomic,strong) NSString * token_id;
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * class_id;
@property(nonatomic,strong) NSString * class_name;
@property(nonatomic,strong) NSArray  * class_ids;
@property(nonatomic,strong) NSArray  * class_names;
@property(nonatomic,strong) NSString * user_name;
@property(nonatomic,strong) NSString * role_name;
@property(nonatomic,strong) NSString * garten_name;
@property(nonatomic,strong) NSString * facePP_key;
@property(nonatomic,strong) NSString * facePP_secret;
@property(nonatomic,strong) NSString * facePP_url;
@property(nonatomic,strong) NSNumber * face_count;

-(id)initWithDictionary:(NSDictionary*)dic;
@end
