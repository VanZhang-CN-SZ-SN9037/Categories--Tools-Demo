//
//  UILabel+MVKit.m
//  MVBaseProject
//
//  Created by DSVanWork on 2017/5/3.
//  Copyright © 2017年 MagicVan. All rights reserved.
//

#import "UILabel+MVKit.h"

@implementation UILabel (MVKit)


+ (CGFloat)mv_heightOfText:(NSString *)text fontSize:(CGFloat)fontSize constraintWidth:(CGFloat)width {
    return [self mv_heightOfText:text fontSize:fontSize constraintWidth:width minimumHeight:0];
}

+ (CGFloat)mv_heightOfText:(NSString *)text fontSize:(CGFloat)fontSize constraintWidth:(CGFloat)width minimumHeight:(CGFloat)height {
    UIFont *systemFont = [UIFont systemFontOfSize:fontSize];
    return [self mv_heightOfText:text font:systemFont constraintWidth:width minimumHeight:height];
}

+ (CGFloat)mv_heightOfText:(NSString *)text font:(UIFont *)font constraintWidth:(CGFloat)width minimumHeight:(CGFloat)height {
    CGFloat finalHeight = 0.0f;
    CGSize constrainedSize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    finalHeight = ceilf(size.height);
    
    // check if setup minimum height and final is lower than the minimum height
    if (height > 0 && finalHeight < height) {
        finalHeight = height;
    }
    return finalHeight;
}

@end

@implementation UILabel (MVAutoSize)

- (UILabel *)mv_resizeLabelHorizontal {
    return [self mv_resizeLabelHorizontal:0];
}

- (UILabel *)mv_resizeLabelVertical {
    return [self mv_resizeLabelVertical:0];
}

- (UILabel *)mv_resizeLabelVertical:(CGFloat)minimumHeigh {
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(newFrame.size.width, CGFLOAT_MAX);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    newFrame.size.height = ceilf(size.height);
    if (minimumHeigh > 0) {
        newFrame.size.height = (newFrame.size.height < minimumHeigh ? minimumHeigh : newFrame.size.height);
    }
    self.frame = newFrame;
    return self;
}

- (UILabel *)mv_resizeLabelHorizontal:(CGFloat)minimumWidth {
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(CGFLOAT_MAX, newFrame.size.height);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    newFrame.size.width = ceilf(size.width);
    if (minimumWidth > 0) {
        newFrame.size.width = (newFrame.size.width < minimumWidth ? minimumWidth: newFrame.size.width);
    }
    self.frame = newFrame;
    return self;
}

@end
