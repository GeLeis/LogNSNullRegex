//
//  GLBMTimer.m
//  BMLib
//
//  Created by gelei on 2018/10/16.
//  Copyright © 2018 冒险元素. All rights reserved.
//

#import "TTBMTimer.h"

@interface GLBMTimer ()
@property (nonatomic,strong) dispatch_source_t timer;
@property (nonatomic, assign) int resumeCount;
@end
@implementation GLBMTimer

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block {
    return [self timerWithTimeInterval:interval queue:dispatch_get_main_queue() block:block];
}
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue block:(void (^)(void))block {
    return [self timerWithTimeInterval:interval queue:queue delay:0 block:block];
}


+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue delay:(NSInteger)dalay block:(void (^)(void))block {
    dispatch_queue_t finalQueue = queue;
    if (!finalQueue) {
        finalQueue = dispatch_get_main_queue();
    }
    GLBMTimer *model = [[GLBMTimer alloc] init];
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, finalQueue);//dispatch_get_global_queue(0, 0)
    /*
     设置定时器(a,b,c,d)
     a 定时器对象
     b 起始时间,dispatch_walltime创建一个绝对时间点，不受手机休眠影响，从创建的开始计算dalay时间，但是进入后台或休眠，event_block还是不会执行
     c 间隔时间
     d 精准度
     */
    //dispatch_time(DISPATCH_TIME_NOW, dalay * NSEC_PER_SEC)
    //dispatch_walltime(NULL, dalay * NSEC_PER_SEC)
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, dalay * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, block);
    dispatch_resume(timer);
    model.timer = timer;
    model.resumeCount++;
    return model;
}

- (void)suspend {
    if (self.resumeCount > 0) {
        dispatch_suspend(self.timer);
        self.resumeCount--;
    }
}

- (void)dealloc {
    if (self.resumeCount == 0) {
        dispatch_resume(self.timer);
    }
    dispatch_cancel(self.timer);
}

@end
