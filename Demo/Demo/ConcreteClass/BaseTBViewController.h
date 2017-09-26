//
//  BaseTBViewController.h
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTBViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak, readonly) UITableView* tableView;

@end
