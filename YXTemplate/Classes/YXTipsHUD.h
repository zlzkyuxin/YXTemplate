//
//  YXTipsHUD.h
//  FBSnapshotTestCase
//
//  Created by 余鑫 on 2019/7/6.
//

#import <UIKit/UIKit.h>

@interface YXTipsHUD : UIView
/**
 初始化
 
 @return 当前弹出提示类
 */
+ (YXTipsHUD *)sharedInstance;
/**
 在当前视图上显示动画
 
 @param images 动画帧图片数组
 @param view 需要显示动画的视图
 */
- (void)showLoadingImages:(NSArray *)images onView:(UIView *)view;
/**
 弹出文字提示
 
 @param str 在当前视图弹出文字提示
 */
- (void)showTips:(NSString *)str;
/**
 隐藏所有提示框
 */
- (void)hideTips;
/**
 延时隐藏所有提示框
 
 @param delay 延时时间
 */
- (void)hideTips:(NSTimeInterval)delay;
@end
