//
//  RCHomeViewController.m
//  animationView
//
//  Created by Admin on 2017/8/15.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "RCHomeViewController.h"
#import "AnimationView.h"
#import "RoomSelectView.h"

@interface RCHomeViewController ()<AnimationViewDelegate> {
    
    BOOL _showView;
}

@property (weak, nonatomic) UIButton *backButton;
@property (weak, nonatomic) UIButton *saveButton;
@property (weak, nonatomic) UIButton *selectButton;

// 批注
@property (weak, nonatomic) UIButton *postilButton;
@property (weak, nonatomic) UIButton *moreButton;
@property (weak, nonatomic) UIButton *otherButton;
@property (weak, nonatomic) UIButton *modelButton;


@property (nonatomic, weak) AnimationView *animationView;
@property (nonatomic, weak) RoomSelectView *roomSelectView;

@end

@implementation RCHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showView = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加按钮
    [self addButtons];
    
}

// 添加按钮
- (void)addButtons {
    
    {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton.titleLabel setFont:WZFont(15.0)];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        backButton.tag = 100;
        [backButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
        self.backButton = backButton;
        
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(10);
            make.left.mas_equalTo(self.view).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
    
    {
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [moreButton.titleLabel setFont:WZFont(15.0)];
        [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        moreButton.tag = 104;
        [moreButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:moreButton];
        self.moreButton = moreButton;
        
        [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view).offset(-30);
            make.left.mas_equalTo(self.view).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
    
    {
        UIButton *postilButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [postilButton setTitle:@"批注" forState:UIControlStateNormal];
        [postilButton.titleLabel setFont:WZFont(15.0)];
        [postilButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        postilButton.tag = 103;
        [postilButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:postilButton];
        self.postilButton = postilButton;
        
        [postilButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.moreButton.mas_top).offset(-10);
            make.left.mas_equalTo(self.view).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
        
    }

    
    {
        UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectButton setTitle:@"选择表" forState:UIControlStateNormal];
        [selectButton.titleLabel setFont:WZFont(15.0)];
        [selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selectButton.tag = 102;
        [selectButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selectButton];
        self.selectButton = selectButton;
        
        [selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.postilButton.mas_top).offset(-10);
            make.left.mas_equalTo(self.view).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
    
    {
        UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [saveButton.titleLabel setFont:WZFont(15.0)];
        [saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        saveButton.tag = 101;
        [saveButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:saveButton];
        self.saveButton = saveButton;
        
        [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.selectButton.mas_top).offset(-10);
            make.left.mas_equalTo(self.view).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
    
    
    {
        UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [otherButton setTitle:@"其他" forState:UIControlStateNormal];
        [otherButton.titleLabel setFont:WZFont(15.0)];
        [otherButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        otherButton.tag = 105;
        [otherButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:otherButton];
        self.otherButton = otherButton;
        
        [otherButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(10);
            make.right.mas_equalTo(self.view).offset(-10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
    {
        UIButton *modelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [modelButton setTitle:@"模块" forState:UIControlStateNormal];
        [modelButton.titleLabel setFont:WZFont(15.0)];
        [modelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        modelButton.tag = 106;
        [modelButton addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:modelButton];
        self.modelButton = modelButton;
        
        [modelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view).offset(-30);
            make.right.mas_equalTo(self.view).offset(-10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(30);
        }];
    }
}

- (void)didClickButtonAction:(UIButton *)btn {
    
    NSInteger tag = btn.tag;
    
    switch (tag) {
        case AnimationViewTypeBack:
            
            [self.navigationController popViewControllerAnimated:YES];
            
            break;
            
        case AnimationViewTypeOther:
            
            [self addRoomSelectView];
            
            break;
        
        
        default:
            break;
    }
    
    
}

- (void)addRoomSelectView {
    
    RoomSelectView *roomSelectView = [RoomSelectView loadView];
    roomSelectView.frame = CGRectMake(100, 10, [UIScreen mainScreen].bounds.size.width - 100 , 30);
    [self.view insertSubview:roomSelectView belowSubview:self.otherButton];
    self.roomSelectView = roomSelectView;
    
    [roomSelectView showAnimation];
    
    self.otherButton.enabled = NO;
    [self.otherButton.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 房间选择视图在 要移除
    if (self.roomSelectView.superview) {
        [self.roomSelectView hideAnimation];
        
        self.otherButton.enabled = YES;
        [self.otherButton.layer addAnimation:[self leftAnimationIn] forKey:@"leftAnimationIn"];
        
        return;
    }
    
    _showView = !_showView;
    
    if (_showView) {
        
        [self showButtonAnimation];
        
    } else {
        
        [self hideButtonAnimation];
    }
    
}

#pragma mark - CABasicAnimation

- (void)showButtonAnimation {
    
    [self.backButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
    [self.saveButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
    [self.selectButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
    [self.postilButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
    [self.moreButton.layer addAnimation:[self rightAnimationIn] forKey:@"rightAnimationIn"];
    
    
    [self.modelButton.layer addAnimation:[self leftAnimationIn] forKey:@"leftAnimationIn"];
    [self.otherButton.layer addAnimation:[self leftAnimationIn] forKey:@"leftAnimationIn"];
}

- (void)hideButtonAnimation {
    
    [self.backButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
    [self.saveButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
    [self.selectButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
    [self.postilButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
    [self.moreButton.layer addAnimation:[self leftAnimationOut] forKey:@"leftAnimationOut"];
    
    [self.modelButton.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
    [self.otherButton.layer addAnimation:[self rightAnimationOut] forKey:@"rightAnimationOut"];
    
}

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

@end
