//
//  BaseNavgationController.m
//  Demo
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseNavgationController.h"

@interface BaseNavgationController ()

@end

@implementation BaseNavgationController

// 是否支持屏幕旋转
- (BOOL)shouldAutorotate {

    return self.topViewController.shouldAutorotate;
}
/** 适用于Push进去的子类调用 @return 屏幕支持的旋转方向 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}

//// 当前的导航控制器是否可以旋转
//-(BOOL)shouldAutorotate{
//
//    return YES;
//}
//
////设置支持的屏幕旋转方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//
//    return self.interfaceOrientationMask;
//}
//
////设置presentation方式展示的屏幕方向
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//
//    return self.interfaceOrientation;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
