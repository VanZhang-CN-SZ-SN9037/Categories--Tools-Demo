//
//  ViewController.m
//  03UIViewCategoryExample
//
//  Created by DSVanWork on 2017/5/5.
//  Copyright © 2017年 DSVanWork. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MVKit.h"
#import "UIColor+MVKit.h"
@interface ViewController (){
    
    UIView *_sbView01;
    
    UIView *_sbView02;
    
    UIView *_sbView03;
    
    UIView *_sbView04;
    
    UIView *_sbView05;
    
    UIView *_sbView06;
    
    UIView *_sbView07;
    
    UIView *_sbView08;
    
    UIView *_sbView09;
    
    UIView *_sbView10;
    
}

@end

@implementation ViewController

-(void)demo_layout_01{
    _sbView01 = [[UIView alloc]init];
    _sbView01.mv_originX = 13;
    _sbView01.mv_originY = 13*5;
    _sbView01.mv_size = CGSizeMake(130, 130);
    [self.view addSubview:_sbView01];
    _sbView01.backgroundColor = [UIColor randomColor];
}
-(void)demo_layout_02{
    _sbView02 = [[UIView alloc]init];
    _sbView02.mv_originX = _sbView01.mv_originX;
    _sbView02.mv_originY = _sbView01.mv_bottom +13;
    _sbView02.mv_size = _sbView01.mv_size;
    [self.view addSubview:_sbView02];
    _sbView02.backgroundColor = [UIColor randomColor];
}
-(void)demo_layout_03{
    _sbView03 = [[UIView alloc]init];
    [_sbView03 plusLeft:_sbView01.mv_right +13];
    [_sbView03 plusTop:_sbView01.mv_originY];
    [_sbView03 plusHeight:_sbView01.mv_height];
    [_sbView03 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView03];
    _sbView03.backgroundColor = [UIColor randomColor];
}
-(void)demo_sbView_01{
    switch ([self.view containSubView:_sbView01]){
        case  YES:{
            NSLog(@"当前视图------->包含_sbView01");
        }break;
        case NO:{
            NSLog(@"当前视图------->不包含_sbView01");
        }break;
    }
}
-(void)demo_sbView_02{
    [self.view removeAllSubviewsExceptViews:@[_sbView01,
                                              _sbView02,
                                              _sbView03,
                                              _sbView04,
                                              _sbView05,
                                              _sbView06,
                                              _sbView07,
                                              _sbView08,
                                              _sbView09]];
}
-(void)demo_sbView_03{
    [self.view removeAllSubViewsExcept:_sbView01];//这个API有毒bug
}
-(void)demo_sbView_04{
    [self.view removeAllSubviews];
}
-(void)demo_orientation_01{
    //    typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
    //        UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown,
    //        UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
    //        UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
    //        UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
    //        UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
    //    }
    UIInterfaceOrientation orientation = [self.view currentOrientation];
    switch (orientation) {
        case UIInterfaceOrientationUnknown:{
            NSLog(@"未知方向");
        }break;
        case UIInterfaceOrientationPortrait:{
            NSLog(@"竖屏---默认");
        }break;
        case UIInterfaceOrientationPortraitUpsideDown:{
            NSLog(@"竖屏---上下翻转");
        }break;
        case UIInterfaceOrientationLandscapeLeft:{
            NSLog(@"横屏---左");
        }break;
        case UIInterfaceOrientationLandscapeRight:{
            NSLog(@"横屏---右");
        }break;
    }
}
-(void)demo_orientation_02{
    //    switch (orientation) {
    //        case UIInterfaceOrientationUnknown:{
    //            NSLog(@"未知方向");
    //        }break;
    //        case UIInterfaceOrientationPortrait:{
    //            NSLog(@"竖屏---默认");
    //        }break;
    //        case UIInterfaceOrientationPortraitUpsideDown:{
    //            NSLog(@"竖屏---上下翻转");
    //        }break;
    //        case UIInterfaceOrientationLandscapeLeft:{
    //            NSLog(@"横屏---左");
    //        }break;
    //        case UIInterfaceOrientationLandscapeRight:{
    //            NSLog(@"横屏---右");
    //        }break;
    //    }
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform transformO = [_sbView01 transformForOrientation:UIInterfaceOrientationPortrait];
        _sbView01.transform = transformO;
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGAffineTransform transform1 = [_sbView01 transformForOrientation:UIInterfaceOrientationPortraitUpsideDown];
            _sbView01.transform = transform1;
            
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.3 animations:^{
                CGAffineTransform transform2 = [_sbView01 transformForOrientation:UIInterfaceOrientationLandscapeLeft];
                _sbView01.transform = transform2;
            }];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.3 animations:^{
                    CGAffineTransform transform3 = [_sbView01 transformForOrientation:UIInterfaceOrientationLandscapeRight];
                    _sbView01.transform = transform3;
                }];
            });
        });
    });
    
}
-(void)demo_separator_01{
    _sbView04 = [[UIView alloc]init];
    _sbView04.mv_originX = _sbView03.mv_originX;
    _sbView04.mv_originY = _sbView03.mv_bottom+13;
    [_sbView04 plusHeight:_sbView01.mv_height];
    [_sbView04 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView04];
    _sbView04.backgroundColor = [UIColor randomColor];
    //
}
-(void)demo_separator_02{
    _sbView05 = [[UIView alloc]init];
    _sbView05.mv_originX = _sbView02.mv_originX;
    _sbView05.mv_originY = _sbView02.mv_bottom+13;
    [_sbView05 plusHeight:_sbView01.mv_height];
    [_sbView05 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView05];
    _sbView05.backgroundColor = [UIColor randomColor];
    [_sbView05 mv_addSeparatorWithType:MVViewSeparatorTypeTop
                             withColor:[UIColor randomColor]];
    //
    _sbView06 = [[UIView alloc]init];
    [_sbView06 plusLeft:_sbView05.mv_right +13];
    [_sbView06 plusTop:_sbView05.mv_originY];
    [_sbView06 plusHeight:_sbView01.mv_height];
    [_sbView06 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView06];
    _sbView06.backgroundColor = [UIColor randomColor];
    [_sbView06 mv_addSeparatorWithType:MVViewSeparatorTypeBottom
                             withColor:[UIColor randomColor]];
    
}
-(void)demo_separator_03{
    _sbView07 = [[UIView alloc]init];
    _sbView07.mv_originX = _sbView05.mv_originX;
    _sbView07.mv_originY = _sbView05.mv_bottom+13;
    [_sbView07 plusHeight:_sbView01.mv_height];
    [_sbView07 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView07];
    _sbView07.backgroundColor = [UIColor randomColor];
    [_sbView07 mv_addSeparatorWithType:MVViewSeparatorTypeVerticalSide
                             withColor:[UIColor randomColor]];
    //
    _sbView08 = [[UIView alloc]init];
    [_sbView08 plusLeft:_sbView07.mv_right +13];
    [_sbView08 plusTop:_sbView07.mv_originY];
    [_sbView08 plusHeight:_sbView01.mv_height];
    [_sbView08 plusWidth:_sbView01.mv_width];
    [self.view addSubview:_sbView08];
    _sbView08.backgroundColor = [UIColor randomColor];
    [_sbView08 mv_addSeparatorWithType:MVViewSeparatorTypeHorizontalSide
                             withColor:[UIColor randomColor]];
}
//
-(void)demo_BadgeView_01{
    _sbView09 = [[UIView alloc]init];
    _sbView09.mv_originX = _sbView07.mv_originX;
    _sbView09.mv_originY = _sbView07.mv_bottom+13;
    [_sbView09 plusHeight:_sbView01.mv_height/2];
    [_sbView09 plusWidth:_sbView01.mv_width/2];
    [self.view addSubview:_sbView09];
    _sbView09.backgroundColor = [UIColor randomColor];
    
    //
    _sbView09.badgeView.displayIfZero = YES;//设置为NO,则无值就隐藏
    _sbView09.badgeView.font = [UIFont systemFontOfSize:13.0f];
    _sbView09.badgeView.badgeColor = [UIColor redColor];
    _sbView09.badgeView.textColor = [UIColor greenColor];
    _sbView09.badgeView.outlineColor = [UIColor blueColor];
    [_sbView09.badgeView setPosition:MVBadgePositionTopLeft];
    _sbView09.badgeView.badgeValue = arc4random()%13;
    //
    _sbView10 = [[UIView alloc]init];
    [_sbView10 plusLeft:_sbView09.mv_right +13];
    [_sbView10 plusTop:_sbView09.mv_originY];
    [_sbView10 plusHeight:_sbView01.mv_height/2];
    [_sbView10 plusWidth:_sbView01.mv_width/2];
    [self.view addSubview:_sbView10];
    _sbView10.backgroundColor = [UIColor randomColor];
    
    _sbView10.badgeView.displayIfZero = YES;
    _sbView10.badgeView.font = [UIFont systemFontOfSize:(arc4random()%13)];
    _sbView10.badgeView.badgeColor = [UIColor randomColor];
    _sbView10.badgeView.textColor = [UIColor randomColor];
    _sbView10.badgeView.outlineColor = [UIColor randomColor];
    [_sbView10.badgeView setPosition:MVBadgePositionBottomRight];
    _sbView10.badgeView.badgeValue = arc4random()%13;
}

-(void)demo_BadgeView_02{
    [_sbView09.badgeView setPosition:MVBadgePositionTopRight];
    [_sbView10.badgeView setPosition:MVBadgePositionBottomLeft];
    _sbView09.badgeView.badgeValue = arc4random()%37;
    _sbView10.badgeView.badgeValue = arc4random()%37;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //布局
    [self demo_layout_01];
    [self demo_layout_02];
    [self demo_layout_03];
    //旋转、当前方向
    [self demo_orientation_01];
    [self demo_orientation_02];
    //分割线
    [self demo_separator_01];
    [self demo_separator_02];
    [self demo_separator_03];
    //角标
    [self demo_BadgeView_01];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.7f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self demo_BadgeView_02];
    });
    //子控件
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(13.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self demo_sbView_01];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self demo_sbView_02];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self demo_sbView_03];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self demo_sbView_04];
                });
            });
        });
    });
}



@end
