//
//  UWScaleButton.h
//  URWorkClient
//
//  Created by zhangjingfei on 7/5/2019.
//  Copyright © 2019 优客工场. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UWScaleButton : UIButton
/**
 *  事件响应最小区域大小(小于此区域则放大，否则保持原大小不变，不赋值保持原大小不变)
 */
@property (nonatomic, assign) CGSize eventFrame;

@end

NS_ASSUME_NONNULL_END
