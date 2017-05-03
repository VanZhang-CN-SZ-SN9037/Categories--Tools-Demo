//
//  ViewController.m
//  1UIColorCategoryExample
//
//  Created by DSVanWork on 2017/5/3.
//  Copyright © 2017年 DSVanWork. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+MVKit.h"
#import <Masonry.h>


@interface ViewController ()
@property(nonatomic,weak)UIView *sbView;

@end

@implementation ViewController
-(void)setupUI{
    UIView *sbView = [[UIView alloc]init];
    [self.view addSubview:sbView];
    [sbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@84);
        make.left.equalTo(@10);
        make.width.height.equalTo(@180);
    }];
    sbView.backgroundColor = [UIColor colorWithHexString:@"#374EE7"];
    self.sbView = sbView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = [UIColor randomColor];
    self.sbView.backgroundColor = [UIColor rgbColorWithR:(arc4random()%256) G:(arc4random()%256) B:(arc4random()%256)];
}

@end
