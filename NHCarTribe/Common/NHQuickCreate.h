//
//  NHQuickCreate.h
//  CarMarket
//
//  Created by NegHao on 15/01/30.
//  Copyright (c) 2015年 NegHao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NHQuickCreate : UIViewController

/**
 创建按钮
  titleColor传nui默认为黑色
  BGColor传nui默认为clearColor
 */
+ (UIButton *)addButtonWithFrame:(CGRect)frame
                     titleColor:(UIColor *)color
                        BGColor:(UIColor *)bgColor
                            Tag:(NSInteger)tag
                         Target:(id)target
                         Action:(SEL)action
                          Title:(NSString *)title;

/**
 创建标签 
 FontName传nil为默认属性Helvetica-Bold
 */
+ (UILabel *)addLabelWithFrame:(CGRect)frame
                     TextColor:(UIColor *)textColor
                       BGColor:(UIColor *)BGColor
                      FontSize:(NSInteger)fontSize
                      FontName:(NSString*)fontName
                 TextAlignment:(NSTextAlignment)textAlignment
                          Text:(NSString *)text;


/**创建图片视图*/
+ (UIImageView *)addImageViewWithFrame:(CGRect)frame
                                 Image:(UIImage *)image
                               BGColor:(UIColor *)bgColor;

/**创建带圆角属性的图片视图*/
+ (UIImageView *)addImageViewWithFrame:(CGRect)frame
                      LayerBorderColor:(UIColor *)borderColor
                      LayerBorderWidth:(CGFloat)borderWidth
                     LayerCornerRadius:(CGFloat)radius
                                 Image:(UIImage *)image
                               isClips:(BOOL)isClips;

/**
 创建文本视图
 FontName传nil为默认属性Helvetica-Bold
 */
+ (UITextField *)addTextFieldWithFrame:(CGRect)frame
                           borderStyle:(UITextBorderStyle)borderStyle
                              FontSize:(NSInteger)fontSize
                              FontName:(NSString *)fontName
                           placeholder:(NSString *)placeholder
                              delegate:(id)object;


/**拨打电话*/
+(UIAlertController *)addAlertControllerOpenUrl:(NSString *)openUrl;



/**判定当前设备型号*/
+(NSString *)doDevicePlatform;
@end

