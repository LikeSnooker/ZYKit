//
//  factory.m
//  SNSRenRen
//
//  Created by sensen on 13-12-5.
//  Copyright (c) 2013年 sensen. All rights reserved.
//

#import "factory.h"
#import "ClickableUIImageView.h"
#import "zyDevice.h"
#import "UIImage+imageNamed_JSen.h"


@implementation factory
+(UIBarButtonItem * )createBarButtonItemWithTarget:(id)target selector:(SEL)
sel title:(NSString*)str
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:str forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:UI_TEXT_COLOR forState:UIControlStateHighlighted];
    [button sizeToFit];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithCustomView:button];
    return btn;
}
+(XXNavigationController *) createNavigationControllerWithRootViewController:(UIViewController*)controller
{
    XXNavigationController * result   = [[XXNavigationController alloc] initWithRootViewController:controller];
    result.navigationBar.barTintColor = UI_NAVI_COLOR;
    result.navigationBar.tintColor    = [UIColor whiteColor];
    result.navigationBar.barStyle     = UIBarStyleBlackOpaque;
    [result.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return result;
}
+(UIButton *)createHeyhaButtonFrame:(CGRect)frame bgImg:(UIImage*) bgImg Title:(NSString *)title target:(id)target Action:(SEL)action Tag:(NSInteger)tag
{
    return nil;
}
+(UILabel *)createLabelFrame:(CGRect )frame Text:(NSString *)text
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setFont: [UIFont systemFontOfSize:13]];
    [label setTextColor:[UIColor darkGrayColor]];
    
    return label;
    //return [label autorelease];
}
//穿件响应手势得label
+(UILabel *)createLabelFrame:(CGRect )frame Text:(NSString *)text action:(SEL)sel target:(id)target
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.userInteractionEnabled =YES;////
    label.backgroundColor = [UIColor clearColor];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setFont: [UIFont systemFontOfSize:13]];
    [label setTextColor:[UIColor whiteColor]];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired =1;
    tap.numberOfTouchesRequired = 1;
    [tap addTarget:target action:sel];

    [label addGestureRecognizer:tap];
  
    return label;
    //return [label autorelease];
}

//创建自定义button
+(UIButton *)createButtonFrame:(CGRect)frame Image:(UIImage*)image Target:(id)target Action:(SEL)action Tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    
    return btn;
}
+(UIButton *)createHeyhaButtonFrame:(CGRect)frame color:(UIColor*)color Title:(NSString *)title Target:(id)target Action:(SEL)action Tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.layer.cornerRadius=6;
    [btn setFrame:frame];
    btn.backgroundColor=color;
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.titleLabel.textColor=[UIColor whiteColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTag:tag];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
//you tag
+(UITextField *)createTextFieldFrame:(CGRect)frame Placeholder:(NSString *)placeholder Delegate:(id)del Tag:(NSInteger)tag
{
    UITextField *tf = [[UITextField alloc]initWithFrame:frame];
    [tf setPlaceholder:placeholder];
    [tf setTag:tag];
    [tf setDelegate:del];
    [tf setFont:[UIFont systemFontOfSize:13]];
    [tf setBorderStyle:UITextBorderStyleRoundedRect];
    
    return tf;
   // return [tf autorelease];
}
//没有tag
+(UITextField *)createTextFieldFrame:(CGRect)frame Placeholder:(NSString *)placeholder Delegate:(id)del 
{
    UITextField *tf = [[UITextField alloc]initWithFrame:frame];
    [tf setPlaceholder:placeholder];
       [tf setDelegate:del];
    [tf setFont:[UIFont systemFontOfSize:13]];
    [tf setBorderStyle:UITextBorderStyleRoundedRect];
    
    return tf;
    // return [tf autorelease];
}

//创建普通button
+(UIButton *)createButtonFrame:(CGRect)frame Title:(NSString *)title Target:(id)target Action:(SEL)action Tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTag:tag];
    [btn setTitleColor:[UIColor colorWithWhite:0.400 alpha:1.000] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+(ClickableUIImageView*)personalInfoMainLabel:(NSString*)name subLabel:(NSString*)sub andBackgroundViewFrame:(CGRect)frame{
    
    ClickableUIImageView *bgView = [[ClickableUIImageView alloc]initWithFrame:frame];
    bgView.image = [UIImage imageNamed:@"基本信息_03@2x.png"];
    bgView.userInteractionEnabled = YES;
    
    UILabel *main = [[UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 15)];
    main.text     = name;
    main.font     = [UIFont boldSystemFontOfSize:15];
    main.backgroundColor = [UIColor clearColor];
    
    UILabel *sub1  = [[UILabel alloc]initWithFrame:CGRectMake(screenWidth-200, 3, 180, 15)];
    sub1.text      = sub;
    sub1.font      = [UIFont systemFontOfSize:13];
    sub1.textColor =[UIColor darkGrayColor];
    sub1.textAlignment = NSTextAlignmentCenter;
    
    //[bgView addSubview:sub1];
    [bgView addSubview:main];
    return bgView;
}

+(ClickableUIImageView*)createDiscoverUIWithAImageName:(NSString*)imageName aTitle:(NSString *)str andFrame:(CGRect)frame{
    CGFloat y = 10;
    
    ClickableUIImageView *bgView = [[ClickableUIImageView alloc]initWithFrame:frame];
    bgView.image = [UIImage imageNamed:@"基本信息_03@2x.png"];
    bgView.userInteractionEnabled = YES;
    
    UIImageView *iView = [[UIImageView alloc]initWithFrame:CGRectMake(5,y , 20, 20)];
    iView.image = [UIImage imageNamed:imageName];
    [bgView addSubview:iView];
    
    UILabel *sub1  = [[UILabel alloc]initWithFrame:CGRectMake(iView.frame.size.width+10,y,70,20)];
    sub1.text      = str;
    sub1.font      = [UIFont boldSystemFontOfSize:14];
    sub1.textColor =[UIColor darkGrayColor];
    sub1.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:sub1];
    
    UIImageView *small = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"更改头像_03.png"]];
    small.frame = CGRectMake(frame.size.width-20, y+3, 10, 10);
    [bgView addSubview:small];
    
    return bgView;
}
//-----------------------------------------------------------
+ (UIButton *)createButtonFrame:(CGRect)frame image:(NSString*)name selectImage:(NSString*)selectImgName target:(id)target action:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImgName] forState:UIControlStateHighlighted];
    btn.frame = frame;
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UILabel *)createHeyhaLabelFrame:(CGRect )frame Text:(NSString *)text action:(SEL)sel target:(id)target
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont: [UIFont systemFontOfSize:13]];
    [label setTextColor:[UIColor whiteColor]];
    UIImageView * imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"报告种类高亮提示框_high"]];
    imageView.frame=CGRectMake(0,10,label.width,label.height-20);
    
    [label.layer insertSublayer:imageView.layer below:label.layer];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired =1;
    tap.numberOfTouchesRequired = 1;
    [tap addTarget:target action:sel];
    
    [label addGestureRecognizer:tap];
    label.userInteractionEnabled=YES;
    return label;
}
+(UILabel *)createHeyhaRoundedrectanglelFrame:(CGRect )frame Text:(NSString *)text prefix:(NSString*)prefix
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=NSTextAlignmentRight;
    UIView * backView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    backView.layer.cornerRadius=5.0;
    backView.backgroundColor=[UIColor grayColor];
    UILabel * prefixLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.height,frame.size.height)];
    prefixLabel.backgroundColor=[UIColor clearColor];
    prefixLabel.textAlignment=NSTextAlignmentLeft;
    [backView addSubview:prefixLabel];
    prefixLabel.text=prefix;
    prefixLabel.textColor=[UIColor whiteColor];
    
    [label.layer insertSublayer:backView.layer below:label.layer];
    return label;
}

+ (TapableImageView*)createTapableImageViewWithFrame:(CGRect)frame WithBlock:(ImageViewBlock)block
{
  
    TapableImageView * img=[[TapableImageView alloc] initWithFrame:frame];
    img.block=block;
    return img;
}
+(MWPhotoBrowser*)createPhotoBrowserWithDelegate:(id<MWPhotoBrowserDelegate>) delegate
{
    MWPhotoBrowser * browser=[[MWPhotoBrowser alloc] initWithDelegate:delegate];
    browser.displayActionButton     = YES;
    browser.displayNavArrows        = NO;
    browser.displaySelectionButtons = NO;
    browser.alwaysShowControls      = NO;
    browser.zoomPhotosToFill        = NO;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;
#endif
    browser.enableGrid            = NO;
    browser.startOnGrid           = NO;
    browser.enableSwipeToDismiss  = YES;
    [browser setCurrentPhotoIndex:0];
    return browser;
}
@end
