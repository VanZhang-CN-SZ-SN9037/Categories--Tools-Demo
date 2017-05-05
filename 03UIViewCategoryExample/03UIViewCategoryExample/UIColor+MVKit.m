//
//  UIColor+MVKit.m
//  MVBaseProject
//
//  Created by DSVanWork on 2017/3/29.
//  Copyright © 2017年 MagicVan. All rights reserved.
//

#import "UIColor+MVKit.h"

#define DEFAULT_VOID_COLOR [UIColor whiteColor]
@implementation UIColor (MVKit)
+(UIColor *)randomColor{
    //    hue 色调
    //    saturation 饱和度
    //    brightness 亮度
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
//    [self rgbColorWithR:(arc4random()%256/256.0) G:(arc4random()%256/256.0) B:(arc4random()%256/256.0)];
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    
}
+(UIColor *)rgbColorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b{
    return [self rgbaColorWithR:r G:g B:b A:1.0];
}
+(UIColor *)rgbaColorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b A:(CGFloat)a{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}


+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
