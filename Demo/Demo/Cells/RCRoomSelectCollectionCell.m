//
//  RCRoomSelectCollectionCell.m
//  animationView
//
//  Created by Admin on 2017/8/16.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "RCRoomSelectCollectionCell.h"

@interface RCRoomSelectCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *contectLabel;


@end

@implementation RCRoomSelectCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setContectStr:(NSString *)contectStr {
    
    _contectStr = contectStr;
    
    self.contectLabel.text = contectStr;
}



@end
