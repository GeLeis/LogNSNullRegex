//
//  AppDelegate.m
//  LogNSNullRegex
//
//  Created by gelei on 2019/8/2.
//  Copyright © 2019 gelei. All rights reserved.
//

#import "AppDelegate.h"
#import <SobotKit/SobotKit.h>
#import "SMLagMonitor.h"
#import "NSObject+Common.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(application:didFinishLaunchingWithOptions:) withSEL:@selector(p_application:didFinishLaunchingWithOptions:)];
    });
}
- (BOOL)p_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self tmp_test];
    return [self p_application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)tmp_test {
//    for (int i = 0; i < 40000; i++) {
//        NSLog(@"%d",i);
//    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[SMLagMonitor shareInstance] beginMonitor];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"sub thread test");
    });
    [self tmp_test];
    [self zcSDKConfig];
#if DEBUG
    //    for iOS
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    [NSThread sleepForTimeInterval:5];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    [NSThread sleepForTimeInterval:5];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)zcSDKConfig {
    //错误日志收集
    [ZCLibClient setZCLibUncaughtExceptionHandler];
    
    /**
     *  接口域名,
     * 默认SaaS平台域名为:https://api.sobot.com
     * 如果您是腾讯云服务，请设置为：https://ten.sobot.com
     * 如果您是本地化部署，请使用你们自己的部署的服务域名
     */
    //[ZCLibClient getZCLibClient].libInitInfo.apiHost = @"域名";
    
    // 初始化，必须执行，并且必须在进入SDK之前调用
    [[ZCLibClient getZCLibClient] initSobotSDK:@"6845b494a3c344cb9c887bbcc66d4adb" result:^(id object) {
        NSLog(@"resut=%@",object);
    }];
    
    // 启动
    if([ZCLibClient getZCLibClient].libInitInfo == nil){
        [ZCLibClient getZCLibClient].libInitInfo = [ZCLibInitInfo new];
    }
    ZCLibInitInfo *initInfo = [ZCLibClient getZCLibClient].libInitInfo;
    // 企业编号 必填
    initInfo.appKey = @"6845b494a3c344cb9c887bbcc66d4adb";
    // 用户id，用于标识用户，建议填写 (注意：userId不要写死比如0，123456，不要设置默认值，否则获取的历史记录相同)
    initInfo.userId = @"1212";
    
    //设置启动参数
    [[ZCLibClient getZCLibClient] setLibInitInfo:initInfo];
    
    [self zcHistoryMsgs];
}

- (void)zcHistoryMsgs {
    //  @note 检查当前消息通道是否建立，没有就重新建立 如果调用 closeIMConnection 后，可调用此方法重新建立链接
    [[ZCLibClient getZCLibClient] checkIMConnected];
    // ReceivedMessageBlock 未读消息数， obj 当前消息  unRead 未读消息数
    [ZCLibClient getZCLibClient].receivedBlock = ^(id obj,int unRead,NSDictionary *object){
        //        NSLog(@"当前消息数：%d \n %@",unRead,obj);
    };
    
    // 关闭通道，清理内存，退出智齿客户
    // 说明：调用此方法后将不能接收到离线消息，除非再次进入智齿SDK重新激活
    //isClosePush:YES ,是关闭push；NO离线用户，但是可以收到push推送+(void) closeAndoutZCServer:(BOOL) isClosePush;
    [ZCLibClient  closeAndoutZCServer:YES];
}

@end
