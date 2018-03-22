//
//  UIView+UIViewZy.h
//  teacher
//
//  Created by lx on 14-10-9.
//  Copyright (c) 2014年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewZy)

-(void)enumerateSubjectWithClass:(Class)cls usingBlock:(void (^)(id subject)) block;
-(void)layoutSubviewHorizontally:(CGSize)bounds;
-(void)layoutSubviewvertically:(CGSize)bound;

@end
