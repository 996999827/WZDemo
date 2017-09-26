//
//  RCListViewController.m
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "RCListViewController.h"
#import "RCHomeViewController.h"

@interface RCListViewController ()

@end

@implementation RCListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseTBCell* cell = [BaseTBCell cell:tableView];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    if (indexPath.row  % 2 == 1) {
        cell.textLabel.text = @"模态弹出";
    } else {
        cell.textLabel.text = @"Push视图";
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row % 2 == 1) {
        RCHomeViewController *homeVC = [[RCHomeViewController alloc]init];
        homeVC.isPush = NO;
        
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.isForceLandscape = YES;
        // 将视图横屏
        [Public setNewOrientation:YES];
        
        [self presentViewController:homeVC animated:YES completion:nil];
        
    } else {
        
        RCHomeViewController *homeVC = [[RCHomeViewController alloc]init];
        homeVC.isPush = YES;
        [self.navigationController pushViewController:homeVC animated:YES];
        
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.isForceLandscape = YES;
        [Public setNewOrientation:YES];
        
    }
}

@end
