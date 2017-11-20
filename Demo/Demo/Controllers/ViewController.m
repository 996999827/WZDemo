//
//  ViewController.m
//  animationView
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "ViewController.h"
#import "RCListViewController.h"
#import "ReactViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)didClickButton:(id)sender {
    
    RCListViewController *listVC = [[RCListViewController alloc]init];
    
    [self.navigationController pushViewController:listVC animated:YES];
}

- (IBAction)didClickRNButton:(id)sender {
    
    ReactViewController *reactVC = [[ReactViewController alloc]init];
    
    [self.navigationController pushViewController:reactVC animated:YES];
    
}


@end
