//
//  YXViewController.m
//  YXTemplate
//
//  Created by 1134548344@qq.com on 07/06/2019.
//  Copyright (c) 2019 1134548344@qq.com. All rights reserved.
//

#import "YXViewController.h"
#import <YXTemplate/YXTipsHUD.h>

@interface YXViewController ()

@end

@implementation YXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[YXTipsHUD sharedInstance] showTips:@"测试自定义类库"];
}

@end
