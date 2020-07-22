//
//  TTBMTimer.h
//  BMLib
//
//  Created by gelei on 2018/10/16.
//  Copyright © 2018 冒险元素. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLBMTimer : NSObject
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block;
+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue block:(void (^)(void))block;

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue delay:(NSInteger)dalay block:(void (^)(void))block;
/**
 挂起
 */
-(void)suspend;
@end

NS_ASSUME_NONNULL_END
