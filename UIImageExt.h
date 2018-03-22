//
//  UIImageExt.h
//  teacher
//
//  Created by 张雨 on 15/4/13.
//  Copyright (c) 2015年 zy. All rights reserved.
//

#import<UIKit/UIKit.h>

@interface UIImage(ColorImage)
+(UIImage*)getColorImageWithHexString:(NSString *)string;
+(UIImage*)getColorImageWithColor:(UIColor *)color;
+ (UIImage *)ZYImageNamed:(NSString*)name;
-(UIImage*)scaleToSize:(CGSize)size;
+ (UIImage *)fixOrientation:(UIImage *)aImage;
@end