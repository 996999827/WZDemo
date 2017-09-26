//
//  Public.m
//  animationView
//
//  Created by Admin on 2017/8/15.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import "Public.h"

@implementation Public

+ (void)setNewOrientation:(BOOL)isForceLandscape {
    
    if (isForceLandscape) {
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
        
    }else{
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
}

@end
