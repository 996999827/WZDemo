//
//  MoreView.m
//  animationView
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "MoreView.h"

@implementation MoreView

+ (instancetype)loadView {
    
    NSString *nibName = NSStringFromClass(self);
    
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil];
    
    return arr.lastObject;
    
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor redColor];
    
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    NSLog(@"%@",sender.titleLabel.text);
}


@end
