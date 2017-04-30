//
//  NSTimer+WTUtils.h
//  Timer
//
//  Created by windtersharp on 16/7/10.
//  Copyright © 2016年 windtersharp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN;

@interface WTTimerTarget : NSObject

@end

@interface NSTimer (WTUtils)

+ (NSTimer *)wt_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *)wt_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *)wt_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo  block:(void(^)(NSTimer *timer))block;

+ (NSTimer *)wt_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget userInfo:(id)userInfo repeats:(BOOL)yesOrNo  block:(void(^)(NSTimer *timer))block;

NS_ASSUME_NONNULL_END;

@end

