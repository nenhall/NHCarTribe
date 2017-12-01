//
//  UIImage+NHExtension.h
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NHExtension)

/**
 *  通过RGB颜色生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  图片压缩，data为空时返回一张默认图片
 *
 *  @param data 图片的data
 *  @param size 压缩后图片尺寸
 *
 *  @return 返回一张新的图片
 */
+ (UIImage *)imageWithData:(NSData *)data scaledToSize:(CGSize)size;

/**
 *  图片压缩
 *
 *  @param image   要压缩的图片
 *  @param newSize 压缩后图片尺寸
 *
 *  @return 返回一张新的图片
 */
+ (UIImage*)imageWithChangeImage:(UIImage*)image scaledToSize:(CGSize)newSize;


/**
 *  按固定宽度对图片压缩
 *
 *  @param sourceImage 图片资源
 *  @param defineWidth 设置固定宽度
 *
 *  @return <#return value description#>
 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


@end
