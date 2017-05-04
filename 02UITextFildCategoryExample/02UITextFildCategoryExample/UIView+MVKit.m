//
//  UIView+MVKit.m
//  MVBaseProject
//
//  Created by MagicVan on 2017/3/28.
//  Copyright © 2017年 MagicVan. All rights reserved.
//

#import "UIView+MVKit.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>


#ifndef SeparatorWidth
#define SeparatorWidth (1.0/[UIScreen mainScreen].scale)
#endif
@implementation UIView (MVKit)
@end
#pragma mark -布局
@implementation UIView(Layout)
/*********************************** originX *************************/
- (void)setMv_originX:(CGFloat)mv_originX{
    CGRect frame = self.frame;
    frame.origin.x = mv_originX;
    self.frame = frame;
}

- (CGFloat)mv_originX{
    return self.frame.origin.x;
} 
/*********************************** originY *************************/
- (void)setMv_originY:(CGFloat)mv_originY{
    CGRect frame = self.frame;
    frame.origin.y = mv_originY;
    self.frame = frame;
}

- (CGFloat)mv_originY{
    return self.frame.origin.y;
}

/*********************************** width *************************/
- (void)setMv_width:(CGFloat)mv_width{
    CGRect frame = self.frame;
    frame.size.width = mv_width;
    self.frame = frame;
}

- (CGFloat)mv_width{
    return  self.frame.size.width;
}

/*********************************** height *************************/
- (void)setMv_height:(CGFloat)mv_height{
    CGRect frame = self.frame;
    frame.size.height = mv_height;
    self.frame = frame;
}

- (CGFloat)mv_height{
    return self.frame.size.height;
}

/*********************************** right *************************/
- (void)setMv_right:(CGFloat)mv_right{
    CGRect frame = self.frame;
    frame.origin.x = mv_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)mv_right{
    return self.frame.origin.x + self.frame.size.width;
}

/*********************************** bottom *************************/
- (void)setMv_bottom:(CGFloat)mv_bottom{
    CGRect frame = self.frame;
    frame.origin.y = mv_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)mv_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

/*********************************** centerX *************************/
- (void)setMv_centerX:(CGFloat)mv_centerX{
    CGRect frame = self.frame;
    frame.origin.x = mv_centerX - frame.size.width/2;
    self.frame = frame;
}

- (CGFloat)mv_centerX{
    return self.frame.origin.x + self.frame.size.width/2;
}

/*********************************** centerY *************************/
- (void)setMv_centerY:(CGFloat)mv_centerY{
    CGRect frame = self.frame;
    frame.origin.y = mv_centerY - self.frame.size.height/2;
    self.frame = frame;
}

- (CGFloat)mv_centerY{
    return self.frame.origin.y + self.frame.size.height/2;
}

/*********************************** origin *************************/
- (void)setMv_origin:(CGPoint)mv_origin{
    CGRect frame = self.frame;
    frame.origin.x = mv_origin.x;
    frame.origin.y = mv_origin.y;
    self.frame = frame;
}

- (CGPoint)mv_origin{
    return CGPointMake(self.frame.origin.x,self.frame.origin.y);
}

/*********************************** size *************************/
- (void)setMv_size:(CGSize)mv_size{
    CGRect frame = self.frame;
    frame.size.width = mv_size.width;
    frame.size.height = mv_size.height;
    self.frame = frame;
}

- (CGSize)mv_size{
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

/*********************************** frame *************************/

/*********************************** plus *************************/
- (void)plusLeft:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.x += value;
    self.frame = frame;
}

- (void)plusTop:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.y += value;
    self.frame = frame;
}

- (void)plusWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width += width;
    self.frame = frame;
}

- (void)plusHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height += height;
    self.frame = frame;
}
@end
@implementation UIView (sbView)

/*********************************** utils *************************/

- (BOOL)containSubView:(UIView*)subView{
    for (UIView * view in self.subviews.reverseObjectEnumerator) {//倒序遍历,响应者链问题
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

/*********************************** remove *************************/
- (void)removeAllSubviews{//数组操作
    [self.subviews  makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)removeAllSubViewsExcept:(UIView*)view{
    for (UIView *view in self.subviews) {
        if (![view isEqual:view]) {
            [view removeFromSuperview];
        }
    }
}

- (void)removeAllSubviewsExceptViews:(NSArray*)views{
    for (UIView *view in self.subviews) {
        if (![views containsObject:view]) {
            [view removeFromSuperview];
        }
    }
}
@end

#pragma mark - orientaion-旋转
@implementation UIView (mv_Orientation)
/*********************************** orientaion *************************/
- (UIInterfaceOrientation)currentOrientation{
    return [UIApplication sharedApplication].statusBarOrientation;
} 
- (CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientaion{
    switch (orientaion) {
        case UIInterfaceOrientationLandscapeLeft:
        {
            return CGAffineTransformMakeRotation(-M_PI/2);
        }
            break;
        case UIInterfaceOrientationLandscapeRight:{
            return CGAffineTransformMakeRotation(M_PI / 2);
        }
            break;
        case UIInterfaceOrientationPortraitUpsideDown:{
            return CGAffineTransformMakeRotation(M_PI);
        }
            break;
        default:{
            return CGAffineTransformIdentity;
        }
            break;
    }
}

@end
#pragma mark- 基础UI
@implementation UIView (BasicUI)
+(instancetype)loadingXibWithFirstObj{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class])
                                        owner:nil
                                      options:nil].firstObject;
}
+(instancetype)loadingXibWithLastObj{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class])
                                        owner:nil
                                      options:nil].lastObject;
}
+(UINib *)loadingNib{
    return [UINib nibWithNibName:NSStringFromClass([self class])
                          bundle:[NSBundle mainBundle]];
}
+(NSString *)view_resueId{
    NSString *reuseId = [NSString stringWithFormat:@"%@",NSStringFromClass([self class])];
    return reuseId;
}
@end

#pragma mark - MBProgressHUD
@implementation UIView (MV_MBProgressHUD)


#pragma mark - runtime

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - methods

- (void)mv_showMessageHUD:(NSString *)message {
    if(!self.hud)
        self.hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.label.text = [message isKindOfClass:[NSString class]]?message:@"";
    self.hud.yOffset = -50.0f;
    self.hud.userInteractionEnabled = NO;
    [self.hud showAnimated:YES];
}

- (void)mv_removeHUD{
    [self.hud hideAnimated:YES];
    self.hud = nil;
}

#pragma mark - static methods

+ (void)mv_showMessage:(NSString *)message {
    [self mv_showMessage:message onParentView:nil];
}

+ (void)mv_showMessage:(NSString *)message onParentView:(UIView *)parentView {
    if (!parentView) {
        UIWindow *topWindows = [[[UIApplication sharedApplication] windows] lastObject];
        parentView = topWindows;
    }
    MBProgressHUD *messageHud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    messageHud.mode = MBProgressHUDModeText;
    messageHud.label.text = [message isKindOfClass:[NSString class]]?message:@"";
    messageHud.yOffset = -50.0f;
    messageHud.userInteractionEnabled = NO;
    [messageHud hideAnimated:YES afterDelay:1.0f];
}

+ (void)mv_showDetailMessage:(NSString *)message {
    [self mv_showDetailMessage:message onParentView:nil];
}

+ (void)mv_showDetailMessage:(NSString *)message onParentView:(UIView *)parentView {
    if (!parentView) {
        UIWindow *topWindows = [[[UIApplication sharedApplication] windows] lastObject];
        parentView = topWindows;
    }
    MBProgressHUD *messageHud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    messageHud.mode = MBProgressHUDModeText;
    messageHud.label.text = @"提示";
    messageHud.detailsLabel.text = [message isKindOfClass:[NSString class]]?message:@"";
    messageHud.yOffset = -50.0f;
    messageHud.userInteractionEnabled = NO;
    [messageHud hideAnimated:YES afterDelay:1.0f];
}
@end
#pragma mark - 截屏
@implementation UIView (MVScreenshot)
- (UIImage *)mv_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

- (UIImage *)mv_screenshotWithOffsetY:(CGFloat)deltaY {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //  KEY: need to translate the context down to the current visible portion of the tablview
    CGContextTranslateCTM(ctx, 0, deltaY);
    [self.layer renderInContext:ctx];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}


@end

#pragma mark - 设置圆角,设置边缘线

@implementation UIView (MVCornerRadius)

- (void)mv_addCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

- (void)mv_addCornerRadius:(CGFloat)radius lineColor:(UIColor *)lineColor {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
    if(lineColor){
        self.layer.borderColor = lineColor.CGColor;
        self.layer.borderWidth = SeparatorWidth;
    }
}
- (void)mv_addBorderColor:(UIColor *)color{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:0.5];
    [self.layer setCornerRadius:4];
}
@end
#pragma mark - 设置分割线

@implementation UIView (MVSeparator)


- (void)mv_addSeparatorWithType:(MVViewSeparatorType)type {
    [self mv_addSeparatorWithType:type withColor:nil];
}

- (void)mv_addSeparatorWithType:(MVViewSeparatorType)type withColor:(UIColor *)color {
    switch (type) {
        case MVViewSeparatorTypeVerticalSide:{
            UIImageView *topLine = [[self class] mv_instanceHorizontalLine:self.frame.size.width color:color];
            [self addSubview:topLine];
            topLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
            UIImageView *bottomLine = [[self class] mv_instanceHorizontalLine:self.frame.size.width color:color];
            bottomLine.frame = CGRectMake(0.0, self.frame.size.height - SeparatorWidth, bottomLine.frame.size.width, SeparatorWidth);
            [self addSubview:bottomLine];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case MVViewSeparatorTypeBottom:{
            UIImageView *bottomLine = [[self class] mv_instanceHorizontalLine:self.frame.size.width color:color];
            bottomLine.frame = CGRectMake(0.0, self.frame.size.height - SeparatorWidth, bottomLine.frame.size.width, SeparatorWidth);
            [self addSubview:bottomLine];
            bottomLine.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        case MVViewSeparatorTypeTop:{
            UIImageView *topLine = [[self class] mv_instanceHorizontalLine:self.frame.size.width color:color];
            [self addSubview:topLine];
            topLine.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        }
            break;
        default:
            break;
    }
}


+ (UIImageView *)mv_instanceHorizontalLine:(CGFloat)width {
    return [self mv_instanceHorizontalLine:width color:[UIColor lightGrayColor]];
}


+ (UIImageView *)mv_instanceVerticalLine:(CGFloat)height {
    return [self mv_instanceVerticalLine:height color:[UIColor lightGrayColor]];
}

+ (UIImageView *)mv_instanceHorizontalLine:(CGFloat)width color:(UIColor *)color {
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, SeparatorWidth)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}

+ (UIImageView *)mv_instanceVerticalLine:(CGFloat)height color:(UIColor *)color{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SeparatorWidth, height)];
    line.backgroundColor = color?:[UIColor lightGrayColor];
    return line;
}


@end

#pragma mark - 角标

@implementation MVBadgeView

static float const kMVBadgeViewInnerSpaceFromBorder = 7.0;
static int const kMVBadgeViewTag = 9876;

#define BADGE_SIDE_OFFSET kMVBadgeViewInnerSpaceFromBorder + _outlineWidth
#define BADGE_TOTAL_OFFSET BADGE_SIDE_OFFSET * 2.0

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
        
        _font = [UIFont boldSystemFontOfSize:13.0];
        _badgeColor = [UIColor blueColor];
        _textColor = [UIColor whiteColor];
        _outlineColor = [UIColor whiteColor];
        _outlineWidth = 2.0;
        _minDiameter = 25.0;
        _position = MVBadgePositionBest;
        _displayIfZero = NO;
        _horizontalOffset = 0.0;
        _verticalOffset = 0.0;
        
        self.backgroundColor = [UIColor clearColor];
        self.opaque = YES;
        self.tag = kMVBadgeViewTag;
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    if(_badgeValue != 0 || _displayIfZero) {
        
        NSString *stringToDraw = [NSString stringWithFormat:@"%ld", (long)_badgeValue];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [_outlineColor set];
        CGContextFillEllipseInRect(context, CGRectInset(rect, 1.0, 1.0));
        
        [_badgeColor set];
        CGContextFillEllipseInRect(context, CGRectInset(rect, _outlineWidth + 1.0, _outlineWidth + 1.0));
        
        CGSize numberSize = [stringToDraw sizeWithAttributes:@{NSFontAttributeName: _font}];
        
        [_textColor set];
        NSMutableParagraphStyle *paragrapStyle = [NSMutableParagraphStyle new];
        paragrapStyle.lineBreakMode = NSLineBreakByClipping;
        paragrapStyle.alignment = NSTextAlignmentCenter;
        
        CGRect lblRect = CGRectMake(rect.origin.x, (rect.size.height / 2.0) - (numberSize.height / 2.0), rect.size.width, numberSize.height);
        
        [stringToDraw drawInRect:lblRect withAttributes:@{
                                                          NSFontAttributeName : _font,
                                                          NSParagraphStyleAttributeName : paragrapStyle,
                                                          NSForegroundColorAttributeName : _textColor
                                                          }];
        
    }
}

#pragma mark - Properties accessor methods

- (void)setBadgeValue:(NSInteger)badgeValue {
    
    if(_badgeValue != badgeValue) {
        
        _badgeValue = badgeValue;
        
        if(badgeValue != 0 || _displayIfZero) {
            [self MV_updateBadgeViewSize];
            
            if(_position == MVBadgePositionBest)
                [self MV_updateBadgeViewPosition];
            
        } else {
            self.frame = CGRectZero;
        }
        
        [self setNeedsDisplay];
    }
}

- (void)setPosition:(MVBadgePosition)position {
    if(_position != position) {
        _position = position;
        [self MV_updateBadgeViewPosition];
        [self setNeedsDisplay];
    }
}

- (void)setMinDiameter:(float)minDiameter {
    if (_minDiameter != minDiameter) {
        _minDiameter = minDiameter;
        
        if(_position == MVBadgePositionBest)
            [self MV_updateBadgeViewPosition];
        
        [self setNeedsDisplay];
    }
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    if(_badgeColor != badgeColor) {
        _badgeColor = badgeColor;
        [self setNeedsDisplay];
    }
}

- (void)setTextColor:(UIColor *)textColor {
    if(_textColor != textColor) {
        _textColor = textColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineColor:(UIColor *)outlineColor {
    if(_outlineColor != outlineColor) {
        _outlineColor = outlineColor;
        [self setNeedsDisplay];
    }
}

- (void)setOutlineWidth:(float)outlineWidth {
    if(_outlineWidth != outlineWidth) {
        _outlineWidth = outlineWidth;
        
        if(_position == MVBadgePositionBest)
            [self MV_updateBadgeViewPosition];
        
        [self setNeedsDisplay];
    }
}

- (void)setFont:(UIFont *)font {
    if(_font != font) {
        _font = font;
        
        [self MV_updateBadgeViewSize];
        
        if(_position == MVBadgePositionBest)
            [self MV_updateBadgeViewPosition];
        
        
        [self setNeedsDisplay];
    }
}

- (void)setDisplayIfZero:(BOOL)displayIfZero {
    if(_displayIfZero != displayIfZero) {
        _displayIfZero = displayIfZero;
        
        if(_badgeValue == 0) {
            if(_displayIfZero) {
                [self MV_updateBadgeViewSize];
                
                if(_position == MVBadgePositionBest)
                    [self MV_updateBadgeViewPosition];
            } else {
                self.frame = CGRectZero;
            }
        }
    }
}

#pragma mark - Private methods

- (void)MV_updateBadgeViewSize {
    //Calculate badge bounds
    CGSize numberSize = [[NSString stringWithFormat:@"%ld", (long)_badgeValue] sizeWithAttributes:@{NSFontAttributeName: _font}];
    
    float badgeHeight = MAX(BADGE_TOTAL_OFFSET + numberSize.height, _minDiameter);
    float badgeWidth = MAX(badgeHeight, BADGE_TOTAL_OFFSET + numberSize.width);
    
    [self setBounds:CGRectMake(0, 0, badgeWidth, badgeHeight)];
}


- (void)MV_updateBadgeViewPosition {
    CGRect superviewFrame = self.superview.frame;
    CGSize badgeSize = self.bounds.size;
    
    MVBadgePosition position = _position;
    
    //Set the best position before
    if(position == MVBadgePositionBest) {
        CGPoint topRightInWindow = [self.superview convertPoint:CGPointMake(superviewFrame.origin.x + superviewFrame.size.width + (badgeSize.width / 2.0), -(badgeSize.height / 2.0)) fromView:nil];
        
        CGSize appFrameSize = [[UIScreen mainScreen] applicationFrame].size;
        
        if(topRightInWindow.x > appFrameSize.width) {
            position = (topRightInWindow.y < appFrameSize.height) ? MVBadgePositionBottomLeft : MVBadgePositionTopLeft;
        } else {
            position = (topRightInWindow.y < appFrameSize.height) ? MVBadgePositionBottomRight : MVBadgePositionTopRight;
        }
    }
    
    switch (position) {
        case MVBadgePositionCenterLeft: {
            self.center = CGPointMake(_horizontalOffset, superviewFrame.size.height / 2 + _verticalOffset);
            break;
        }
        case MVBadgePositionCenterRight: {
            self.center = CGPointMake(superviewFrame.size.width + _horizontalOffset, superviewFrame.size.height / 2 + _verticalOffset);
            break;
        }
        case MVBadgePositionTopRight: {
            self.center = CGPointMake(superviewFrame.size.width + _horizontalOffset, _verticalOffset);
            break;
        }
        case MVBadgePositionTopLeft: {
            self.center = CGPointMake(_horizontalOffset, _verticalOffset);
            break;
        }
        case MVBadgePositionBottomRight: {
            self.center = CGPointMake(superviewFrame.size.width + _horizontalOffset, superviewFrame.size.height + _verticalOffset);
            break;
        }
        case MVBadgePositionBottomLeft: {
            self.center = CGPointMake(_horizontalOffset, superviewFrame.size.height + _verticalOffset);
            break;
        }
        default:
            break;
    }
}

@end



static const char *kMVBadgeViewPropertyKey = "kMVBadgeViewPropertyKey";

@implementation UIView (MVBadgeView)

- (void)setBadgeView:(MVBadgeView *)badgeView {
    objc_setAssociatedObject(self, kMVBadgeViewPropertyKey, badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MVBadgeView *)badgeView {
    
    MVBadgeView *badgeView = objc_getAssociatedObject(self, kMVBadgeViewPropertyKey);
    
    if (!badgeView) {
        self.badgeView = [[MVBadgeView alloc] initWithFrame:CGRectZero];
        badgeView = objc_getAssociatedObject(self, kMVBadgeViewPropertyKey);
        [self addSubview:badgeView];
    }
    
    return badgeView;
}

@end


