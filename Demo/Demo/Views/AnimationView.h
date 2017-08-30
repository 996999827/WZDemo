//
//  AnimationView.h
//  animationView
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AnimationView;

typedef NS_ENUM(NSInteger, AnimationViewType) {
    AnimationViewTypeBack = 100,   //返回
    AnimationViewTypeSave,
    AnimationViewTypeSelect,
    AnimationViewTypepostil,//批注
    AnimationViewTypeMore,
    AnimationViewTypeOther, //其他
    AnimationViewTypeModel, //模块
};

@protocol AnimationViewDelegate <NSObject>

@optional
- (void)animationView:(AnimationView *)animationView didClickButton:(UIButton *)btn WithType:(AnimationViewType)type;

@end

@interface AnimationView : UIView

+ (instancetype)loadAnimationView;

@property (nonatomic, weak) id<AnimationViewDelegate> delegate;

@end
