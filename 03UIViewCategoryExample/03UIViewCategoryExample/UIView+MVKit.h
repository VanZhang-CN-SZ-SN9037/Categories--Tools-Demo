//
//  UIView+MVKit.h
//  MVBaseProject
//
//  Created by MagicVan on 2017/3/28.
//  Copyright © 2017年 MagicVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MVKit)
@end
#pragma mark - layout-布局
@interface UIView (Layout)
/** Shortcut key for frame.origin.x
 */
@property (nonatomic,assign) CGFloat mv_originX;

/** Shortcut key for frame.origin.y
 */
@property (nonatomic,assign) CGFloat mv_originY;

/** Shortcut key for frame.size.width
 */
@property (nonatomic,assign) CGFloat mv_width;

/** Shortcut key for frame.size.height
 */
@property (nonatomic,assign) CGFloat mv_height;

/** Shortcut key for frame.origin.x + frame.size.width
 */
@property (nonatomic,assign) CGFloat mv_right;

/** Shortcut key for frame.origin.y + frame.size.height
 */
@property (nonatomic,assign) CGFloat mv_bottom;

/** Shortcut key for center.x
 */
@property (nonatomic,assign) CGFloat mv_centerX;

/** Shortcut key for center.y
 */
@property (nonatomic,assign) CGFloat mv_centerY;

/** Shortcut key for origin
 */
@property (nonatomic,assign) CGPoint mv_origin;

/** Shortcut key for size
 */
@property (nonatomic,assign) CGSize mv_size;

/** increase on the basic of original origin.x
 */
- (void)plusLeft:(CGFloat)value;

/** increase on the basic of original origin.y
 */
- (void)plusTop:(CGFloat)value;

/** increase on the basic of original width
 */
- (void)plusWidth:(CGFloat)width;

/** Increase on the basic of original heigh
 */
- (void)plusHeight:(CGFloat)height;

@end

#pragma mark - subView-子控件相关
@interface UIView (sbView)
/**  does it include the special subView
 */
- (BOOL)containSubView:(UIView*)subView;

/** remove all subviews from supview
 */
- (void)removeAllSubviews;

/** Remove all Subviews from Supview Except special view
 */
- (void)removeAllSubViewsExcept:(UIView*)view;

/** Remove all Subviews from Supview Except special Views
 */
- (void)removeAllSubviewsExceptViews:(NSArray*)views;
@end

#pragma mark - orientaion-旋转
@interface UIView (mv_Orientation)

/**  return device current orientaion
 */
- (UIInterfaceOrientation)currentOrientation;

/** transform orientaion with orientation enum
 */
- (CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientaion;

@end
#pragma mark - 基础UI配置
@interface UIView (BasicUI)
+(instancetype)loadingXibWithFirstObj;
+(instancetype)loadingXibWithLastObj;
+(UINib*)loadingNib;
+(NSString*)view_resueId;
@end
#pragma mark - MBProgressHUD

@interface UIView (MV_MBProgressHUD)

/**
 *  Show only text HUD View
 *
 *  @param message The message text
 */
- (void)mv_showMessageHUD:(NSString *)message;

/**
 *  Remove the HUD
 */
- (void)mv_removeHUD;

/**
 *  Show only text HUD View with class method
 *
 *  @param message message text
 */
+ (void)mv_showMessage:(NSString *)message;

/**
 *  Show only the HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)mv_showMessage:(NSString *)message onParentView:(UIView *)parentView;

/**
 *  Show detail text HUD View
 *
 *  @param message message text
 */
+ (void)mv_showDetailMessage:(NSString *)message;

/**
 *  Show detail text HUD View on any parentView
 *
 *  @param message   message text
 *  @param parentView parentView
 */
+ (void)mv_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView;

@end

#pragma mark - 截屏
@interface UIView (MVScreenshot)
/**
 *  Get a screenshot from a view with Y offset
 *
 *  @param deltaY offset Y
 *
 *  @return The screenshot image.
 */
- (UIImage *)mv_screenshotWithOffsetY:(CGFloat)deltaY;

/**
 *  Get a screenshot with all the partern of view.
 *
 *  @return The screenshot image
 */
- (UIImage *)mv_screenshot;

@end

#pragma mark - 设置圆角,设置边缘线

@interface UIView (MVCornerRadius)

/**
 *  Add corner radius layer on the view
 *
 *  @param radius The radius width
 */
- (void)mv_addCornerRadius:(CGFloat)radius;

/**
 *  Add corner radius layer on the view with line color
 *
 *  @param radius    The radius width
 *  @param lineColor The line color
 */
- (void)mv_addCornerRadius:(CGFloat)radius lineColor:(UIColor *)lineColor;
- (void)mv_addBorderColor:(UIColor *)color;

@end

#pragma mark - 分割线处理
typedef NS_OPTIONS(NSUInteger, MVViewSeparatorType) {
    MVViewSeparatorTypeTop             = 1 << 0,
    MVViewSeparatorTypeLeft            = 1 << 1,
    MVViewSeparatorTypeBottom          = 1 << 2,
    MVViewSeparatorTypeRight           = 1 << 3,
    MVViewSeparatorTypeVerticalSide    = 1 << 4,
    MVViewSeparatorTypeHorizontalSide  = 1 << 5,
    MVViewSeparatorTypeAll             = 1 << 6
};


@interface UIView (MVSeparator)

/**
 *  Add the separator line on the view
 *
 *  @param type view-separtor-type
 */
- (void)mv_addSeparatorWithType:(MVViewSeparatorType)type;

/**
 *  Add the separator line on the view
 *
 *  @param type  view-separtor-type
 *  @param color line-color
 */
- (void)mv_addSeparatorWithType:(MVViewSeparatorType)type withColor:(UIColor *)color;

/**
 *  Instance a horizontal line with the width
 *
 *  @param width line-width
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)mv_instanceHorizontalLine:(CGFloat)width;

/**
 *  Instance a horizontal line with the width & color
 *
 *  @param width line-width
 *  @param color line-color
 *
 *  @return a horizontal line imageView
 */
+ (UIImageView *)mv_instanceHorizontalLine:(CGFloat)width color:(UIColor *)color;
/**
 *  Instance a vertical line with the height
 *
 *  @param height line-height
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)mv_instanceVerticalLine:(CGFloat)height;

/**
 *   instance a vertical line with the height & color
 *
 *  @param height line-height
 *  @param color linet-color
 *
 *  @return a vertical line imageView
 */
+ (UIImageView *)mv_instanceVerticalLine:(CGFloat)height color:(UIColor *)color;
@end
#pragma mark - 下角标 
typedef NS_ENUM(NSUInteger, MVBadgePosition) {
    MVBadgePositionCenterLeft,
    MVBadgePositionCenterRight,
    MVBadgePositionTopLeft,
    MVBadgePositionTopRight,
    MVBadgePositionBottomLeft,
    MVBadgePositionBottomRight,
    MVBadgePositionBest
};


@interface MVBadgeView : UIView

@property (nonatomic) MVBadgePosition position;

@property (nonatomic) NSInteger badgeValue;

@property(strong, nonatomic) UIFont *font;

@property(strong, nonatomic) UIColor *badgeColor;

@property(strong, nonatomic) UIColor *textColor;

@property(strong, nonatomic) UIColor *outlineColor;

@property (nonatomic) float outlineWidth;

@property (nonatomic) float minDiameter;

@property (nonatomic) BOOL displayIfZero;

@property (nonatomic) float horizontalOffset;

@property (nonatomic) float verticalOffset;

@end
@interface UIView (MVBadgeView)
@property(nonatomic, readonly) MVBadgeView *badgeView;
@end
















