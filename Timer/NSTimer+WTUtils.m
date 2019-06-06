//
//  NSTimer+WTUtils.m
//  Timer
//
//  Created by windtersharp on 16/7/10.
//  Copyright © 2016年 windtersharp. All rights reserved.
//

#import "NSTimer+WTUtils.h"

@interface WTTimerTarget ()

@property (nonatomic,weak) id sourceTarget;
@property (nonatomic,copy) void(^actionBlock)(NSTimer *timer);
@property (nonatomic, assign) SEL actionSelector;

@end

@implementation WTTimerTarget

- (instancetype)initWithSelector:(SEL)aSelector  sourceTarget:(id)sourceTarget {
    self = [super init];
    if (self) {
        self.actionBlock = nil;
        self.sourceTarget = sourceTarget;
        self.actionSelector = aSelector;
    }
    return self;
}

- (instancetype)initWithBlock:(void(^)(NSTimer *timer))block sourceTarget:(id)sourceTarget {
    self = [super init];
    if (self) {
        self.actionBlock = block;
        self.sourceTarget = sourceTarget;
    }
    return self;
}

- (void)timerAction:(NSTimer *)timer {
    if (self.sourceTarget == nil) {
        [timer invalidate];
        timer = nil;
    } else {
        if (self.actionBlock) {
            self.actionBlock(timer);
        }else{
            IMP imp = [self.sourceTarget methodForSelector:self.actionSelector];
            void (*func)(id, SEL,NSTimer *) = (void *)imp;
            func(self.sourceTarget, self.actionSelector,timer);
        }
    }
}

@end

@implementation NSTimer (WTUtils)

+ (NSTimer *)wt_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    WTTimerTarget *timerTarget = [[WTTimerTarget alloc] initWithSelector:aSelector sourceTarget:aTarget];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timerTarget selector:@selector(timerAction:) userInfo:userInfo repeats:yesOrNo];
    return timer;

}

+ (NSTimer *)wt_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    WTTimerTarget *timerTarget = [[WTTimerTarget alloc] initWithSelector:aSelector sourceTarget:aTarget];
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:timerTarget selector:@selector(timerAction:) userInfo:userInfo repeats:yesOrNo];
    return timer;
}

+ (NSTimer *)wt_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget userInfo:(id)userInfo repeats:(BOOL)yesOrNo  block:(void(^)(NSTimer *timer))block {
    WTTimerTarget *timerTarget = [[WTTimerTarget alloc] initWithBlock:block sourceTarget:aTarget];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timerTarget selector:@selector(timerAction:) userInfo:userInfo repeats:yesOrNo];
    return timer;
}

+ (NSTimer *)wt_timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget userInfo:(id)userInfo repeats:(BOOL)yesOrNo  block:(void(^)(NSTimer *timer))block {
    WTTimerTarget *timerTarget = [[WTTimerTarget alloc] initWithBlock:block sourceTarget:aTarget];
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:timerTarget selector:@selector(timerAction:) userInfo:userInfo repeats:yesOrNo];
    return timer;
}

@end


