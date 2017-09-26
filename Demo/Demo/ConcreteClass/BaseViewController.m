//
//  BaseViewController.m
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addBackButton {
    if (self.navigationController.viewControllers.count <= 1) {
        return;
    }
    
    self.navigationItem.leftBarButtonItem = [self itemWithTarget:self action:@selector(popViewController) image:@"Back" highImage:@"Back"];
}

/**
 定义返回按钮样式
 */
- (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)popViewController {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
