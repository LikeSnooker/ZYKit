//
//  UserModel.m
//  Parent
//
//  Created by 张雨 on 15/4/29.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import "UserModel.h"
#import "SBJson.h"
@implementation UserModel
-(id)initWithDictionary:(NSDictionary*)dic
{
    self=[super init];
    if(self)
    {
        NSDictionary * obj=[dic objectForKey:@"obj"];
        _app_id       =[obj valueForKey:@"app_id"];
        _token_id     =[obj valueForKey:@"token_id"];
        
        @try {
     
            _name=[obj objectForKey:@"name"];
            
            NSArray * class_idArr=[obj objectForKey:@"class_ids"];
            _class_ids=   class_idArr;
            _class_id     = [class_idArr objectAtIndex:0];
            
            NSArray * class_nameArr=[obj objectForKey:@"class_names"];
            _class_names=    class_nameArr;
            _class_name   = [class_nameArr objectAtIndex:0];
            id facePPDic  = [obj objectForKey:@"facePlusPlus"];
            if([facePPDic isKindOfClass:[NSDictionary class]] || [facePPDic isKindOfClass:[NSMutableDictionary class]])
            {
                _facePP_key   = [facePPDic objectForKey:@"api_key"];
                _facePP_secret= [facePPDic objectForKey:@"api_secret"];
                _facePP_url   = [facePPDic objectForKey:@"api_url"];
                _face_count   = [facePPDic objectForKey:@"face_count"];
            }
            else if([facePPDic isKindOfClass:[NSString class]] || [facePPDic isKindOfClass:[NSMutableString class]])
            {
                SBJsonParser * jsonParser = [[SBJsonParser alloc] init];
                NSDictionary* faceDic     = [jsonParser objectWithString:facePPDic];
                if(faceDic != nil)
                {
                    _facePP_key   = [faceDic objectForKey:@"api_key"];
                    _facePP_secret= [faceDic objectForKey:@"api_secret"];
                    _facePP_url   = [faceDic objectForKey:@"api_url"];
                    _face_count   = [faceDic objectForKey:@"face_count"];
                }
            }

        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
        _role_name   =[obj objectForKey:@"role_name"];
        _garten_name =[obj objectForKey:@"garten_name"];
    }
    return self;
}
@end
