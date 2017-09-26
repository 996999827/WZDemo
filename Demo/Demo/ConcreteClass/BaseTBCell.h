//
//  BaseTBCell.h
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTBCell : UITableViewCell

+ (instancetype)cell:(UITableView*)tableView;
+ (instancetype)xibCell:(UITableView*)tableView;
+ (instancetype)blankCell:(UITableView*)tableView;

@end
