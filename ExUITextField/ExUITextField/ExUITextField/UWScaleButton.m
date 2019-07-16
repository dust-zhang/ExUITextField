//
//  UWScaleButton.m
//  URWorkClient
//
//  Created by zhangjingfei on 7/5/2019.
//  Copyright © 2019 优客工场. All rights reserved.
//

//功能：
//重写pointInside方法，扩大按钮的点击范围

#import "UWScaleButton.h"

@implementation UWScaleButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event{
    
    CGRect bounds = self.bounds;
    CGFloat widthExtra = MAX(self.eventFrame.width - bounds.size.width, 0);
    CGFloat heightExtra = MAX(self.eventFrame.height - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -1.5 * widthExtra, -1.5 * heightExtra);
    return CGRectContainsPoint(bounds, point);
}

@end
