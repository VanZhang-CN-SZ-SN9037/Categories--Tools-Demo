//
//  UIColor+MVKit.h
//  MVBaseProject
//
//  Created by DSVanWork on 2017/3/29.
//  Copyright © 2017年 MagicVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MVKit)

+(UIColor *)randomColor;
+(UIColor *)rgbColorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b ;
+(UIColor *)rgbaColorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a;

/**
 *  通过16进制字符串创建指定的颜色
 *
 *  @param stringToConvert 16进制字符串
 *
 *  @return  指定的颜色值
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
