//
//  BaseNavgationController.h
//  Demo
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavgationController : UINavigationController

//旋转方向 默认竖屏
@property (nonatomic , assign) UIInterfaceOrientation interfaceOrientation;
@property (nonatomic , assign) UIInterfaceOrientationMask interfaceOrientationMask;

@end
