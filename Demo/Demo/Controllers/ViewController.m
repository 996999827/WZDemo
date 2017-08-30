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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)didClickButton:(id)sender {
    
    RCHomeViewController *homeView = [[RCHomeViewController alloc]init];
    
    [self.navigationController pushViewController:homeView animated:YES];
    
}

@end
