//
//  factory.h
//  SNSRenRen
//
//  Created by sensen on 13-12-5.
//  Copyright (c) 2013年 sensen. All rights reserved.
//
#import "TapableImageView.h"
#import <UIKit/UIKit.h>
#import "MWPhotoBrowser.h"
#import "SculptureView.h"
#import "XXNavigationController.h"
@class ClickableUIImageView;

@interface factory : UIView
////////////////// heyha 专用
+(UIBarButtonItem * )createBarButtonItemWithTarget:(id)target selector:(SEL)
sel title:(NSString*)str;
+(XXNavigationController *) createNavigationControllerWithRootViewController:(UIViewController*)controller;
+(UILabel *)createHeyhaLabelFrame:(CGRect )frame Text:(NSString *)text action:(SEL)sel target:(id)target;
+(UIButton *)createHeyhaButtonFrame:(CGRect)frame color:(UIColor*) color Title:(NSString *)title Target:(id)target Action:(SEL)action Tag:(NSInteger)tag;

+(UIButton *)createHeyhaButtonFrame:(CGRect)frame bgImg:(UIImage*) bgImg Title:(NSString *)title target:(id)target Action:(SEL)action Tag:(NSInteger)tag;
//////////////////


//创建响应手势得label
+(UILabel *)createLabelFrame:(CGRect )frame Text:(NSString *)text action:(SEL)sel target:(id)target;



//创建自定义button

+(UIButton *)createButtonFrame:(CGRect)frame Image:(UIImage*)image Target:(id)target Action:(SEL)action Tag:(NSInteger)tag;

//创建普通button

+(UIButton *)createButtonFrame:(CGRect)frame Title:(NSString *)title Target:(id)target Action:(SEL)action Tag:(NSInteger)tag;

+(UITextField *)createTextFieldFrame:(CGRect)frame Placeholder:(NSString *)placeholder Delegate:(id)del Tag:(NSInteger)tag;
//没有tag
+(UITextField *)createTextFieldFrame:(CGRect)frame Placeholder:(NSString *)placeholder Delegate:(id)del;

+(ClickableUIImageView*)personalInfoMainLabel:(NSString*)name subLabel:(NSString*)sub andBackgroundViewFrame:(CGRect)frame;


+(ClickableUIImageView*)createDiscoverUIWithAImageName:(NSString*)imageName aTitle:(NSString *)str andFrame:(CGRect)frame;

//-------------本项目用得---------------
+ (UIButton *)createButtonFrame:(CGRect)frame image:(NSString*)name selectImage:(NSString*)selectImgName target:(id)target action:(SEL)sel;


////heyha
+ (TapableImageView*)createTapableImageViewWithFrame:(CGRect)frame WithBlock:(ImageViewBlock)block;
+(MWPhotoBrowser*)createPhotoBrowserWithDelegate:(id<MWPhotoBrowserDelegate>) delegate;
@end
