//
//  zyDevice.h
//  huabo
//
//  Created by admin on 14-2-25.
//  Copyright (c) 2014年 华博创意. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "KMActivityIndicator.h"
#define CLR_BLUE    [UIColor colorWithRed:81/255.0 green:194/255.0 blue:204/255.0 alpha:1.0]
#define CLR_YELLOW  [UIColor colorWithRed:243/255.0 green:183/255.0 blue:58/255.0 alpha:1.0]
#define CLR_PURPLE  [UIColor colorWithRed:143/255.0 green:44/255.0 blue:237/255.0 alpha:1.0]
#define CLR_GREEN   [UIColor colorWithRed:108/255.0 green:245/255.0 blue:50/255.0 alpha:1.0]
#define CLR_PINK    [UIColor colorWithRed:224/255.0 green:49/255.0 blue:184/255.0 alpha:1.0]
#define CLR_ORANGE  [UIColor colorWithRed:234/255.0 green:128/255.0 blue:50/255.0 alpha:1.0]
#define CLR_RED     [UIColor colorWithRed:211/255.0 green:66/255.0 blue:41/255.0 alpha:1.0]



@interface zyDevice : NSObject

+(void)showKMActivityIndicatorInViewController:(UIViewController*)vc;
+(void)showHUDInWindowWithText:(NSString *)text;
+ (void)showHUDInWindowWithText:(NSString *)text withDetailText:(NSString*)detail;
+(void)makeRoundedCorner:(UIView *)view UpOrDown:(BOOL)up;
+(UIImage*)grayscale:(UIImage*)anImage type:(int)type;
+(float)getOSVersion;
+(float)getScreenWidth;
+(float)getScreenHeight;
+(NSString *)getIphoneName;
+(Reachability*)sharedReach;
+(BOOL)netOK;
+ (NSString *)createUUID;

@end


#define kScreenWidth [zyDevice getScreenWidth]
#define kScreenHeight [zyDevice getScreenHeight]
#define kOSVersion [JsDevice getOSVersion]

#define isIOS7 ([JsDevice getOSVersion] >= 7)

//--------------适配-------------------
#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))
//-------------------------------------

#define SysFont(f) [UIFont systemFontOfSize:f]
#define BoldFont(f) [UIFont boldSystemFontOfSize:f]



#define kDeviceSerialNo [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//-------------------------------------
#define IOS7 if([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)\
{self.extendedLayoutIncludesOpaqueBars = NO;\
self.modalPresentationCapturesStatusBarAppearance =NO;\
self.edgesForExtendedLayout = UIRectEdgeNone;}
