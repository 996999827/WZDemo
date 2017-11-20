//
//  ReactViewController.m
//  Demo
//
//  Created by Admin on 2017/11/20.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "ReactViewController.h"
#import <React/RCTRootView.h>

@interface ReactViewController ()

@end

@implementation ReactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RN视图";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * strUrl = @"http://localhost:8081/index.bundle?platform=ios&dev=true";
    NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
    
    RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                         moduleName:@"BBDTek"
                                                  initialProperties:nil
                                                      launchOptions:nil];
    
    rootView.frame = CGRectMake(0, 100, 375, 300);
    [self.view addSubview:rootView];
    
}

@end
