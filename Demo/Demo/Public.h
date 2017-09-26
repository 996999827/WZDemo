//
//  Public.h
//  animationView
//
//  Created by Admin on 2017/8/15.
//  Copyright © 2017年 Jha. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WZStr(...) [NSString stringWithFormat:__VA_ARGS__]
#define WZFont(size) [UIFont systemFontOfSize:(size)]
#define WZBFont(size) [UIFont boldSystemFontOfSize:(size)]
#define WZCGM(X, Y, W, H) CGRectMake((X), (Y), (W), (H))

// 打印日志
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

// 屏幕尺寸
#define UI_SCREEN_WIDTH      ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT     ([[UIScreen mainScreen] bounds].size.height)
#define UI_STATUS_BAR_WIDTH  ([[UIApplication sharedApplication] statusBarFrame].size.width)
#define UI_STATUS_BAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)


NS_ASSUME_NONNULL_BEGIN


static inline BOOL IsEmptyValue(id _Nullable thing) {
    return (thing == nil)
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *) thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *) thing count] == 0)
    || ([thing isKindOfClass:[NSNull class]]);
}


static inline NSString *_Nullable checkValueNil(NSString *_Nullable value) {
    if (IsEmptyValue(value)) {
        return nil;
    }
    return value;
}


static inline NSString *_Nullable CheckValue(NSString *_Nullable value) {
    if (IsEmptyValue(value)) {
        return @"";
    }
    return value;
}

@interface Public : NSObject

// 设置设备方向
+ (void)setNewOrientation:(BOOL)isForceLandscape;

@end

NS_ASSUME_NONNULL_END
