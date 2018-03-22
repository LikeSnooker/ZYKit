//
//  UIView+UIViewZy.m
//  teacher
//
//  Created by lx on 14-10-9.
//  Copyright (c) 2014年 zy. All rights reserved.
//

#import "UIView+UIViewZy.h"

UIImage * oringe;
@implementation UIView (UIViewZy)
- (void) enumerateSubjectWithClass:(Class)cls usingBlock:(void (^)(id subject))block
{
    for(id sub in self.subviews)
    {
        if([sub isKindOfClass:cls])
        {
            __weak id weakSub=sub;
            block(weakSub);
        }
    }
}
-(void)layoutSubviewHorizontally:(CGSize)bounds
{
    float subViewCount=(float)self.subviews.count;
    for(int m=0;m<self.subviews.count;m++)
    {
        float offX=(self.width/subViewCount-bounds.width)/2.0+m/subViewCount*self.width;
        ((UIView*)[self.subviews objectAtIndex:m]).frame=CGRectMake(offX,(self.height-bounds.height)/2,bounds.width,bounds.height);
    }
}

-(void)layoutSubviewvertically:(CGSize)bound
{

}
@end
