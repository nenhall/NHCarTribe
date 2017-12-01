//
//  QuickCreate.m
//  CarMarket
//
//  Created by NegHao on 15/01/30.
//  Copyright (c) 2015年 NegHao. All rights reserved.
//

#import "sys/sysctl.h"
#import "sys/utsname.h"
#import "NHQuickCreate.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface NHQuickCreate ()

@end

@implementation NHQuickCreate

/**
 创建普通按钮
 */
+ (UIButton *)addButtonWithFrame:(CGRect)frame
                      titleColor:(UIColor *)titleColor
                         BGColor:(UIColor *)bgColor
                             Tag:(NSInteger)tag
                          Target:(id)target
                          Action:(SEL)action
                           Title:(NSString *)title{

    UIButton *button = [[UIButton alloc] init];
    button.frame = frame;
    if (bgColor == nil) {
        bgColor = [UIColor clearColor];
    }
    [button setBackgroundColor:bgColor];
    if (titleColor == nil) {
        titleColor = [UIColor blackColor];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.tag = tag;
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


/**创建标签*/
+ (UILabel *)addLabelWithFrame:(CGRect)frame
                    TextColor:(UIColor *)textColor
                      BGColor:(UIColor *)BGColor
                     FontSize:(NSInteger)fontSize
                     FontName:(NSString *)fontName
                TextAlignment:(NSTextAlignment)textAlignment
                         Text:(NSString *)text{

    UILabel *lable = [[UILabel alloc] init];
    lable.frame = frame;
    lable.text = text;
    lable.textColor = textColor;
    lable.backgroundColor = BGColor;
    lable.numberOfLines = 0;
    lable.textAlignment = textAlignment;
    if (fontName == nil) {
        fontName = @"Helvetica-Bold";
    }
    lable.font = [UIFont fontWithName:fontName size:fontSize];
    return lable;

}


/**创建图片视图*/
+ (UIImageView *)addImageViewWithFrame:(CGRect)frame
                                 Image:(UIImage *)image
                               BGColor:(UIColor *)bgColor{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = frame;
    imageView.image = image;
    imageView.backgroundColor = bgColor;
    return imageView;
}


/**创建带圆角属性的图片视图*/
+ (UIImageView *)addImageViewWithFrame:(CGRect)frame
                      LayerBorderColor:(UIColor *)borderColor
                      LayerBorderWidth:(CGFloat)borderWidth
                     LayerCornerRadius:(CGFloat)radius
                                 Image:(UIImage *)image
                               isClips:(BOOL)isClips{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = frame;
    imageView.layer.borderColor = borderColor.CGColor;
    imageView.layer.borderWidth = borderWidth;
    imageView.layer.cornerRadius = radius;
    imageView.clipsToBounds = isClips;
    imageView.image = image;
    return imageView;
}


/**创建文本视图*/
+ (UITextField *)addTextFieldWithFrame:(CGRect)frame
                           borderStyle:(UITextBorderStyle)borderStyle
                              FontSize:(NSInteger)fontSize
                              FontName:(NSString *)fontName
                           placeholder:(NSString *)placeholder
                              delegate:(id)object{

    UITextField *textField = [[UITextField alloc] init];
    textField.frame = frame;
    textField.borderStyle = UITextBorderStyleNone;
    textField.delegate = object;
    textField.placeholder = placeholder;
    if (fontName == nil) {
        fontName = @"Helvetica-Bold";
    }
    textField.font = [UIFont fontWithName:fontName size:fontSize];
    textField.returnKeyType = UIReturnKeyNext;
    return textField;
}


// 拨打电话
+(UIAlertController *)addAlertControllerOpenUrl:(NSString *)openUrl{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:openUrl  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSString *url = [NSString stringWithFormat:@"tel://%@",openUrl];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    return alert;
}


/**老版提示窗口*/
+(UIAlertView *)addAlertViewWithTitle:(NSString *)title Message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherTitle Delegate:(id)delegate{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:otherTitle otherButtonTitles:cancelTitle, nil];
    return alertview;
}


/**判定当前设备型号*/
+(NSString *)doDevicePlatform{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    if ([platform isEqualToString:@"iPhone1,1"]) {
        platform = @"iPhone";
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        platform = @"iPhone 3G";
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        platform = @"iPhone 3GS";
    } else if ([platform isEqualToString:@"iPhone3,1"]||[platform isEqualToString:@"iPhone3,2"]||[platform isEqualToString:@"iPhone3,3"]) {
        platform = @"iPhone 4";
    } else if ([platform isEqualToString:@"iPhone4,1"]) {
        platform = @"iPhone 4S";
    } else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]) {
        platform = @"iPhone 5";
    }else if ([platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]) {
        platform = @"iPhone 5C";
    }else if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        platform = @"iPhone 5S";
    }else if ([platform isEqualToString:@"iPhone7,1"]){
        platform = @"iPhone 6Plus";
    }else if ([platform isEqualToString:@"iPhone7,2"]){
        platform = @"iPhone 6";
    }else if ([platform isEqualToString:@"iPhone8,1"]){
        platform = @"iPhone 6s";
    }else if ([platform isEqualToString:@"iPhone8,2"]){
        platform = @"iPhone 6sPlus";
    //iPod
    }else if ([platform isEqualToString:@"iPod4,1"]) {
        platform = @"iPod touch 4";
    }else if ([platform isEqualToString:@"iPod5,1"]) {
        platform = @"iPod touch 5";
    }else if ([platform isEqualToString:@"iPod3,1"]) {
        platform = @"iPod touch 3";
    }else if ([platform isEqualToString:@"iPod2,1"]) {
        platform = @"iPod touch 2";
    }else if ([platform isEqualToString:@"iPod1,1"]) {
        platform = @"iPod touch";
    //iPad
    }else if ([platform isEqualToString:@"iPad3,2"]||[platform isEqualToString:@"iPad3,1"]||[platform isEqualToString:@"iPad3,3"]) {
        platform = @"iPad 3";
    }else if ([platform isEqualToString:@"iPad2,2"]||[platform isEqualToString:@"iPad2,1"]||[platform isEqualToString:@"iPad2,3"]||[platform isEqualToString:@"iPad2,4"]) {
        platform = @"iPad 2";
    }else if ([platform isEqualToString:@"iPad1,1"]) {
        platform = @"iPad 1";
    }else if ([platform isEqualToString:@"iPad2,5"]||[platform isEqualToString:@"iPad2,6"]||[platform isEqualToString:@"iPad2,7"]) {
        platform = @"ipad mini";
    }else if ([platform isEqualToString:@"iPad3,4"]||[platform isEqualToString:@"iPad3,5"]||[platform isEqualToString:@"iPad3,6"]) {
        platform = @"ipad 4";
    }else if ([platform isEqualToString:@"iPad4,1"]||[platform isEqualToString:@"iPad4,2"]||[platform isEqualToString:@"iPad4,3"]){
        platform = @"iPad Air";
    }else if ([platform isEqualToString:@"iPad5,3"]||[platform isEqualToString:@"iPad5,4"]){
        platform = @"iPad Air 2";
    }else if ([platform isEqualToString:@"iPad4,4"]||[platform isEqualToString:@"iPad4,5"]||[platform isEqualToString:@"iPad4,6"]) {
        platform = @"iPad mini 2";
    }else if ([platform isEqualToString:@"iPad4,7"]||[platform isEqualToString:@"iPad4,8"]||[platform isEqualToString:@"iPad4,9"]) {
        platform = @"iPad mini 3";
    }
    return platform;
}

/**
-(void)showLXAlertView{
    
    _alertWindow=[[UIWindow alloc] initWithFrame:MainScreenRect];
    _alertWindow.windowLevel=UIWindowLevelAlert;
    [_alertWindow becomeKeyWindow];
    [_alertWindow makeKeyAndVisible];
    
    [_alertWindow addSubview:_alertView];
    
    [self setShowAnimation];
    
}

-(void)shraeView{
    _alertView=[[UIView alloc] init];
    _alertView.frame=CGRectMake(self.bounds.origin.x, self.bounds.origin.y + 100, AlertView_W, 100);
    _alertView.backgroundColor=[UIColor whiteColor];
    _alertView.layer.cornerRadius=6.0;
    _alertView.layer.masksToBounds=YES;
    _alertView.userInteractionEnabled=YES;
    _alertView.backgroundColor = BKRedColor;
    //计算_alertView的高度
    //    _alertView.center=self.center;
    //    [self addSubview:_alertView];
    [self setShowAnimation];
}

-(void)setShowAnimation{
    CGPoint startPoint = CGPointMake(-AlertView_W, self.center.y);
    _alertView.layer.position=startPoint;
    
    //damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
    //velocity:弹性复位的速度
    [UIView animateWithDuration:.8 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _alertView.layer.position=self.center;
        
    } completion:^(BOOL finished) {
    }];
}
*/

@end
