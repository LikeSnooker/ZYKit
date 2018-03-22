//
//  zyDevice.m
//  huabo
//
//  Created by admin on 14-2-25.
//  Copyright (c) 2014年 华博创意. All rights reserved.
//

#import "zyDevice.h"
#import "MBProgressHUD.h"
@implementation zyDevice

static id _s = nil;
+(void)showKMActivityIndicatorInViewController:(UIViewController*)vc
{
    KMActivityIndicator * acti   = [[KMActivityIndicator alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    UIViewController *    actiVC = [[UIViewController alloc] init];
    actiVC.view                  = acti;
    
    [acti startAnimating];
    [vc presentPopupViewController:actiVC animationType:MJPopupViewAnimationFade];
}
+ (void)showHUDInWindowWithText:(NSString *)text{
    UIWindow * window            =[[[UIApplication sharedApplication] windows] objectAtIndex:0];
    MBProgressHUD * hud          =[MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode                     =MBProgressHUDModeText;
    hud.labelText                =text;
    hud.margin                   =10.f;
    hud.yOffset                  =150.f;
    hud.removeFromSuperViewOnHide=YES;
    [hud hide:YES afterDelay:1];
}
+ (void)showHUDInWindowWithText:(NSString *)text withDetailText:(NSString*)detail{
    UIWindow * window            =[[[UIApplication sharedApplication] windows] objectAtIndex:0];
    MBProgressHUD * hud          =[MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode                     =MBProgressHUDModeText;
    hud.labelText                =text;
    hud.detailsLabelText         =detail;
    hud.margin                   =10.f;
    hud.yOffset                  =150.f;
    hud.removeFromSuperViewOnHide=YES;
    [hud hide:YES afterDelay:3];
}
+(void)makeRoundedCorner:(UIView *)view UpOrDown:(BOOL)up
{
    UIBezierPath *maskPath;
  //  CGRect view_bound=CGRectMake(0, 0, kScreenWidth-8, 70);
    CGRect view_bound=view.bounds;
    if(up)
    {
        maskPath=[UIBezierPath bezierPathWithRoundedRect:view_bound byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
    }
    else
    {
        maskPath=[UIBezierPath bezierPathWithRoundedRect:view_bound byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(4, 4)];
    }
    CAShapeLayer * maskLayer=[CAShapeLayer layer];
    maskLayer.frame = view_bound;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask=maskLayer;
}

+(UIImage*)grayscale:(UIImage*)anImage type:(int)type {
    
    CGImageRef imageRef = anImage.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    
    size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
    
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    
    bool shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    
    CGColorRenderingIntent intent = CGImageGetRenderingIntent(imageRef);
    
    CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
    
    CFDataRef data = CGDataProviderCopyData(dataProvider);
    
    UInt8 *buffer = (UInt8*)CFDataGetBytePtr(data);
    
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8 *tmp;
            tmp = buffer + y * bytesPerRow + x * 4;
            
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            switch (type) {
                case 1:
                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
                case 2:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green * 0.7;
                    *(tmp + 2) = blue * 0.4;
                    break;
                case 3:
                    *(tmp + 0) = 255 - red;
                    *(tmp + 1) = 255 - green;
                    *(tmp + 2) = 255 - blue;
                    break;
                default:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green;
                    *(tmp + 2) = blue;
                    break;
            }
        }
    }
    
    
    CFDataRef effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));
    
    CGDataProviderRef effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef effectedCgImage = CGImageCreate(
                                               width, height,
                                               bitsPerComponent, bitsPerPixel, bytesPerRow,
                                               colorSpace, bitmapInfo, effectedDataProvider,
                                               NULL, shouldInterpolate, intent);
    
    UIImage *effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];
    
    CGImageRelease(effectedCgImage);
    
    CFRelease(effectedDataProvider);
    
    CFRelease(effectedData);
    
    CFRelease(data);
    
    return [effectedImage autorelease];
    
}

+(NSArray*)getCompentsOfDate:(NSDate*)date
{
    NSCalendar * calendar=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
    int year =(int)[comps year];
    int month=(int)[comps month];
    int day  =(int)[comps day];
    int hour = (int)[comps hour];
    int min = (int)[comps minute];
    int sec = (int)[comps second];
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:year],[NSNumber numberWithInt:month],[NSNumber numberWithInt:day],[NSNumber numberWithInt:hour],[NSNumber numberWithInt:min],[NSNumber numberWithInt:sec],nil];
                      
}


+(id)sharedReach{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _s = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    });
    return _s;
}

+(BOOL)netOK{
    return [[[self class] sharedReach] isReachable];
}

+(float)getOSVersion{
    return [[[UIDevice currentDevice] systemVersion]floatValue];
}

+(float)getScreenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

+(float)getScreenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

+(NSString*)getIphoneName{
    return [[UIDevice currentDevice]name];
}
+ (NSString *)createUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    
    
    CFRelease(uuidObject);
    
    return uuidStr;
}
@end
