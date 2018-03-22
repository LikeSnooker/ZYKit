//
//  UIView+scale.m
//  Client
//
//  Created by lx on 14-8-28.
//  Copyright (c) 2014年 zy. All rights reserved.
//

#import "UIView+scale.h"

@implementation UIView (scale)
-(void)scaleTo:(float)scaleRate
{
    //将view  和 所有的subView 按照比例缩放
    
    [self scaleView:self toScale:scaleRate];
    
}
-(void)scaleView:(UIView *)view toScale:(float)scaleRate
{
    if([view.subviews count]==0)
    {
        CGRect frame=view.frame;
        frame.origin.x*=scaleRate;
        frame.origin.y*=scaleRate;
        frame.size.width*=scaleRate;
        frame.size.height*=scaleRate;
        view.frame=frame;
    }
    else
    {
        for(UIView * subView in view.subviews)
        {
            [self scaleView:subView toScale:scaleRate];
        }
    }
}
@end
