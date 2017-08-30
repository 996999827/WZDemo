//
//  AnimationView.m
//  animationView
//
//  Created by Admin on 2017/8/14.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "AnimationView.h"
#import "MoreView.h"

@interface AnimationView ()<CAAnimationDelegate> {
    
    BOOL _showView;
}

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (weak, nonatomic) IBOutlet UIButton *selectButton;

// 批注
@property (weak, nonatomic) IBOutlet UIButton *postilButton;

@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@property (weak, nonatomic) IBOutlet UIButton *otherButton;

@property (weak, nonatomic) IBOutlet UIButton *modelButton;

@property (nonatomic, weak) MoreView *moreView;

@end

@implementation AnimationView

+ (instancetype)loadAnimationView {
    
    NSString *nibName = NSStringFromClass(self);
    
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil];
    
    return arr.lastObject;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    //    self.backgroundColor = [UIColor redColor];
    
    _showView = YES;
    
    self.userInteractionEnabled = YES;
    
    MoreView *moreView = [MoreView loadView];
    moreView.frame = CGRectMake(60, [UIScreen mainScreen].bounds.size.height - 60, 300, 30);
    moreView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    
    [self addSubview:moreView];
    self.moreView = moreView;
    self.moreView.hidden = YES;
}


- (IBAction)moreButtonAction:(UIButton *)sender {
    sender.selected =! sender.selected;
    
    if (sender.selected) { //显示
        self.moreView.hidden = NO;

        CABasicAnimation *showAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        showAnimation.fromValue = @(0);
        showAnimation.toValue = @(1);
        showAnimation.duration = 0.35;
        showAnimation.removedOnCompletion = NO;
        showAnimation.fillMode = kCAFillModeForwards;
        showAnimation.autoreverses = NO;
        
        //锚点：（图层旋转绕着锚点进行的）
        self.moreView.layer.anchorPoint = CGPointMake(0, 0);
        
        //position:确定锚点在父图层的位置
        self.moreView.layer.position = CGPointMake(60, [UIScreen mainScreen].bounds.size.height - 60);
        
        [self.moreView.layer addAnimation:showAnimation forKey:@"showAnimation"];
        
        
        
    } else { //隐藏
//        self.moreView.hidden = YES;
        
        CABasicAnimation *hideAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        hideAnimation.fromValue = @(1);
        hideAnimation.toValue = @(0);
        hideAnimation.duration = 0.35;
        hideAnimation.removedOnCompletion = NO;
        hideAnimation.fillMode = kCAFillModeForwards;
        hideAnimation.autoreverses = NO;
        hideAnimation.delegate = self;

        self.moreView.layer.anchorPoint = CGPointMake(0, 0);
        
        //position:确定锚点在父图层的位置
        self.moreView.layer.position = CGPointMake(60,[UIScreen mainScreen].bounds.size.height - 60);
        
        [self.moreView.layer addAnimation:hideAnimation forKey:@"hideAnimation"];
        
    }
    
}


- (IBAction)buttonDidAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.tag == 105) { // 其他
        
//        [sender.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(animationView:didClickButton:WithType:)]) {
            
            [self.delegate animationView:self didClickButton:sender WithType:AnimationViewTypeOther];
        }
    } else if (sender.tag == 100) {// 返回
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(animationView:didClickButton:WithType:)]) {
            
            [self.delegate animationView:self didClickButton:sender WithType:AnimationViewTypeBack];
        }
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.otherButton.selected) {
        
        self.otherButton.selected = NO;
        [self.nextResponder touchesBegan:touches withEvent:event];
        return;
        
    } 
    
    
    if (!self.moreView.hidden) { //隐藏moreView
        
        [self moreButtonAction:self.moreButton];
        
        return;
    }
    
    _showView = !_showView;
    
    if (_showView) {
        
        [self.backButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
        [self.saveButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
        [self.selectButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
        [self.postilButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
        [self.moreButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
        
        
        [self.modelButton.layer addAnimation:[self leftAnimationIn] forKey:@"leftAnimationIn"];
        [self.otherButton.layer addAnimation:[self leftAnimationIn] forKey:@"leftAnimationIn"];
        
    } else {
        
        [self.backButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
        [self.saveButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
        [self.selectButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
        [self.postilButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
        [self.moreButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
        
        [self.modelButton.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
        [self.otherButton.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
        
    }
    
}

#pragma mark - CABasicAnimation
// 右移动画(移出)
- (CABasicAnimation *)rightAnimationOut {
    
    CABasicAnimation *rightAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    rightAnimation.fromValue = @(0);
    rightAnimation.toValue = @(60);
    rightAnimation.duration = 0.35;
    rightAnimation.removedOnCompletion = NO;
    rightAnimation.fillMode = kCAFillModeForwards;
    rightAnimation.autoreverses = NO;
    
    return rightAnimation;
}

// 左移动画(移出)
- (CABasicAnimation *)leftAnimationOut {
    
    CABasicAnimation *leftAnimationOut = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    leftAnimationOut.fromValue = @(0);
    leftAnimationOut.toValue = @(-60);
    leftAnimationOut.duration = 0.35;
    leftAnimationOut.removedOnCompletion = NO;
    leftAnimationOut.fillMode = kCAFillModeForwards;
    leftAnimationOut.autoreverses = NO;
    
    return leftAnimationOut;
}

// 右移动画(移入)
- (CABasicAnimation *)rightAnimationIn {
    
    CABasicAnimation *rightAnimationIn = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    rightAnimationIn.fromValue = @(-60);
    rightAnimationIn.toValue = @(0);
    rightAnimationIn.duration = 0.35;
    rightAnimationIn.removedOnCompletion = NO;
    rightAnimationIn.fillMode = kCAFillModeForwards;
    rightAnimationIn.autoreverses = NO;
    
    return rightAnimationIn;
}

// 左移动画(移入)
- (CABasicAnimation *)leftAnimationIn {
    
    CABasicAnimation *leftAnimationIn = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    leftAnimationIn.fromValue = @(60);
    leftAnimationIn.toValue = @(0);
    leftAnimationIn.duration = 0.35;
    leftAnimationIn.removedOnCompletion = NO;
    leftAnimationIn.fillMode = kCAFillModeForwards;
    leftAnimationIn.autoreverses = NO;
    
    return leftAnimationIn;
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([anim isEqual:[self.moreView.layer animationForKey:@"hideAnimation"]]) {
        
        self.moreView.hidden = YES;
    }
    
    
}


@end
