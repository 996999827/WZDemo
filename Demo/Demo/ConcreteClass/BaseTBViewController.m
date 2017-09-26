//
//  BaseTBViewController.m
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseTBViewController.h"

@interface BaseTBViewController ()

@property (nonatomic, weak) UITableView* tableView;

@end

@implementation BaseTBViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTBView];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (void)setupTBView {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 15.0)];
    tableView.tableFooterView = footerView;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;

    if (@available(iOS 11.0, *)) {
        self.tableView.estimatedRowHeight =0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return tableView.height-tableView.contentInset.top-tableView.contentInset.bottom;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTBCell* cell = [BaseTBCell cell:tableView];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.text = NSStringFromClass(self.class);
    
    return cell;
}



@end
