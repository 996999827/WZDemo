//
//  BaseTBCell.m
//  Demo
//
//  Created by Admin on 2017/9/26.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "BaseTBCell.h"

@implementation BaseTBCell

+ (instancetype)cell:(UITableView*)tableView {
    NSString* ID = NSStringFromClass(self);
    BaseTBCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    
    return cell;
}

+ (instancetype)xibCell:(UITableView*)tableView {
    NSString* ID = NSStringFromClass(self);
    BaseTBCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    
    return cell;
}

+ (instancetype)blankCell:(UITableView*)tableView {
    static NSString* const ID = @"BaseTBBlanckCellIdentifier";
    BaseTBCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

@end
