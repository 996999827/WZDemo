//
//  BaseTabBarController.m
//  Demo
//
//  Created by Admin on 2017/9/1.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

+ (void)initialize {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:99.0/255.0f green:99.0/255.0f blue:99.0/255.0f alpha:1.0f];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:18/255.0f green:183/255.0f blue:245/255.0f alpha:1.0f];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addController];
}

- (void)addController {
    
    [self setupChildVc:[[EUCDialogController alloc] init] title:@"消息" image:@"Dialog" selectedImage:@"Dialog_Selected"];
    
    [self setupChildVc:[[EUCContactController alloc] init] title:@"通讯录" image:@"Contact" selectedImage:@"Contact_Selected"];
    
    [self setupChildVc:[[EUCUserController alloc] init] title:@"我的" image:@"User" selectedImage:@"User_Selected"];
    
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    BaseNavgationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
