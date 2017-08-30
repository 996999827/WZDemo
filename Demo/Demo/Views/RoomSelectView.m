//
//  RoomSelectView.m
//  animationView
//
//  Created by Admin on 2017/8/15.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "RoomSelectView.h"
#import "RCRoomSelectCollectionCell.h"

@interface RoomSelectView ()<UICollectionViewDelegate,UICollectionViewDataSource,CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *cellArray;

@end

@implementation RoomSelectView

- (NSArray *)cellArray {
    
    if (_cellArray == nil) {
        
        _cellArray =@[@"玄关S01",@"客厅S02",@"餐厅S03",@"厨房S04",@"主卫S05",@"次卫S06",@"主卧S07",@"次卧S08",@"衣帽间S09",@"阳台S10",@"走廊S011"];
    }
    
    return _cellArray;
    
}

+ (instancetype)loadView {
    
    NSString *nibName = NSStringFromClass(self);
    
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil];
    
    return arr.lastObject;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
     UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 200);
    //2) 行与行之间最小的间距
    flowLayout.minimumLineSpacing = 30;
    
    //3) 同一行每个item之间的最小间距
    flowLayout.minimumInteritemSpacing = 50;
    
    //调节与UICollectionView 上下左右之间的距离
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //4) 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平
    
    self.collectionView.collectionViewLayout = flowLayout;
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([RCRoomSelectCollectionCell class]) bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([RCRoomSelectCollectionCell class])];
}

- (void)showAnimation {
    
    //锚点：（图层旋转绕着锚点进行的）
    self.layer.anchorPoint = CGPointMake(1, 0.5);
    
    //position:确定锚点在父图层的位置
    self.layer.position = CGPointMake(UI_SCREEN_WIDTH  , 10 + 15);
    
    CABasicAnimation *showAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    showAnimation.fromValue = @(0);
    showAnimation.toValue = @(1);
    showAnimation.duration = 0.35;
    showAnimation.removedOnCompletion = NO;
    showAnimation.fillMode = kCAFillModeForwards;
    showAnimation.autoreverses = NO;
    
    [self.layer addAnimation:showAnimation forKey:@"showAnimation"];
    
    
}

- (void)hideAnimation {
    
    //锚点：（图层旋转绕着锚点进行的）
    self.layer.anchorPoint = CGPointMake(1, 0.5);
    
    //position:确定锚点在父图层的位置
    self.layer.position = CGPointMake(UI_SCREEN_WIDTH  , 10 + 15);
    
    CABasicAnimation *hideAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    hideAnimation.fromValue = @(1);
    hideAnimation.toValue = @(0);
    hideAnimation.duration = 0.35;
    hideAnimation.removedOnCompletion = NO;
    hideAnimation.fillMode = kCAFillModeForwards;
    hideAnimation.autoreverses = NO;
    hideAnimation.delegate = self;
    
    [self.layer addAnimation:hideAnimation forKey:@"hideAnimation"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([anim isEqual:[self.layer animationForKey:@"hideAnimation"]] &&self.superview) {
        [self removeFromSuperview];
    }

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.cellArray.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RCRoomSelectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RCRoomSelectCollectionCell class]) forIndexPath:indexPath];
    
    cell.contectStr = self.cellArray[indexPath.row];
    
    return cell;
}

@end
