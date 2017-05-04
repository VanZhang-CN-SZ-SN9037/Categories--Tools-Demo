//
//  ViewController.m
//  02UITextFildCategoryExample
//
//  Created by DSVanWork on 2017/5/4.
//  Copyright © 2017年 DSVanWork. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+MVKit.h"
#import "UILabel+MVKit.h"
#import "UIView+MVKit.h"
#import <ReactiveCocoa.h>
@interface ViewController ()

@end

@implementation ViewController

-(void)setupUI{
    UITextField *txf = [[UITextField alloc]initWithFrame:CGRectMake(13, 64+13, self.view.mv_width-13*2, 37)];
    
    
    txf.placeholder = @"请随便输入字符";
    txf.backgroundColor = [UIColor randomColor];
    [self.view addSubview:txf];
    
    //
    UILabel *tmpLabel   = [[UILabel alloc]init];
    tmpLabel.font       = [UIFont systemFontOfSize:13.0f];
    tmpLabel.textColor  = [UIColor orangeColor];
    tmpLabel.mv_width   = self.view.mv_width-13*2;
    tmpLabel.mv_originX = txf.mv_originX;
    tmpLabel.mv_originY = txf.mv_bottom + 37;
    [self.view addSubview:tmpLabel];
    tmpLabel.numberOfLines = 0;//这句很关键
    //
    [txf.rac_textSignal subscribeNext:^(id x) {
        tmpLabel.text = [NSString stringWithFormat:@"%@",x];
        tmpLabel.mv_height = [UILabel mv_heightOfText:tmpLabel.text fontSize:13.0f constraintWidth:(self.view.mv_width-13*2)];
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}



@end
