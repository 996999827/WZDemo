//
//  ViewController.m
//  animationView
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "ViewController.h"
#import "RCHomeViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

// 设置屏幕方向开始的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)didClickButton:(id)sender {
    
    RCHomeViewController *homeView = [[RCHomeViewController alloc]init];
    self.navigationController.navigationBarHidden = YES;
    [self presentViewController:homeView animated:YES completion:^{
        
        
    }];
//    [self.navigationController pushViewController:homeView animated:YES];
}

@end
