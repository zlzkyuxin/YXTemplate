//
//  YXTipsHUD.m
//  FBSnapshotTestCase
//
//  Created by 余鑫 on 2019/7/6.
//

#import "YXTipsHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXTipsHUD()

@property (nonatomic , strong) MBProgressHUD *customHud;

@end

@implementation YXTipsHUD

+ (YXTipsHUD *)sharedInstance {
    static YXTipsHUD *tipsHud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tipsHud = [[YXTipsHUD alloc] init];
        
    });
    return tipsHud;
}

/**
 在当前视图上显示动画
 
 @param images 动画帧图片数组
 @param view 需要显示动画的视图
 */
- (void)showLoadingImages:(NSArray *)images onView:(UIView *)view {
    //过滤掉空数组
    NSAssert(images.count != 0, @"当前动画帧数组不能为空！");
    
    //过滤掉非图片数组
    for (id image in images) {
        
        NSAssert([image isKindOfClass:[UIImage class]], @"当前动画帧数组中出现非图片元素");
    }
    
    if (_customHud) {
        
        [_customHud removeFromSuperview];
        _customHud = nil;
    }
    
    _customHud = [[MBProgressHUD alloc] initWithView:view];
    //关闭交互
    _customHud.userInteractionEnabled = NO;
    //弹出视图模式
    _customHud.mode = MBProgressHUDModeCustomView;
    [_customHud showAnimated:YES];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.center = _customHud.center;
    //设置动画帧数组
    [imageView setAnimationImages:images];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    //设置动画帧时间
    [imageView setAnimationDuration:images.count * 0.075];
    //开始动画
    [imageView startAnimating];
    _customHud.customView = imageView;
    [_customHud setContentColor:[UIColor clearColor]];
    //取消弹出框背景的半透明
    _customHud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _customHud.bezelView.backgroundColor = [UIColor clearColor];
    
    [view addSubview:_customHud];
}


/**
 显示提示文字
 
 @param str 提示文字
 */
- (void)showTips:(NSString *)str {
    
    [_customHud removeFromSuperview];
    _customHud = nil;
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    _customHud = [[MBProgressHUD alloc] init];
    
    _customHud.mode = MBProgressHUDModeCustomView;
    _customHud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _customHud.bezelView.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15.0];
    label.textColor = [UIColor whiteColor];
    if (str.length > 0) {
        label.text = str;
        CGSize size =  [self sizeWithString:label.text font:label.font];
        label.frame = CGRectMake(0, 0, size.width, size.height);
        label.textAlignment = NSTextAlignmentCenter;
        _customHud.customView = label;
        
        [keyWindow addSubview:_customHud];
        
        [_customHud showAnimated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self displayDurationForString:label.text] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hideTips];
        });
        
    }else{
        [_customHud hideAnimated:YES];
    }

}

/**
 隐藏提示框
 */
- (void)hideTips {
    
    _customHud.removeFromSuperViewOnHide = YES;
    [_customHud hideAnimated:YES];
    _customHud = nil;
}

/**
 延时隐藏所有提示框
 
 @param delay 延时时间
 */
- (void)hideTips:(NSTimeInterval)delay {
    
    _customHud.removeFromSuperViewOnHide = YES;
    [_customHud hideAnimated:YES afterDelay:delay];
    _customHud = nil;
    
}

/**
 计算文字宽高
 
 @param string 文字内容
 @param font 文字字体大小
 @return 需要展示的宽高
 */
- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(200, 8000)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传入文字的大小
                                       context:nil];
    return rect.size;
}

/**
 根据文字长度计算展示时间
 
 @param string 需要计算的文字
 @return 文字需要展示的时间
 */
- (NSTimeInterval)displayDurationForString:(NSString*)string {
    return MIN((float)string.length*0.06 + 1, 3.0);
}

@end
