//
//  main.m
//  LogNSNullRegex
//
//  Created by gelei on 2019/8/2.
//  Copyright © 2019 gelei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "fishhook.h"

//#if !DEBUG
//函数指针,用来保存原始的函数的地址
static void (*origin_nslog)(NSString *format,...);
void redirect_nslog(NSString *format,...) {
    printf("测试");
    //继续执行原log
    va_list va;
    va_start(va, format);
    //    [NSString stringWithFormat:format,va]
    NSLogv(format,va);
    va_end(va);
}
//#endif

static void(*origin_ctest)(void);

void ctest2(){
    printf("\nctest2\n");
}

void ctest(){
    printf("\nctest\n");
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
//#if !DEBUG
        //method1:利用fishhook,截取NSLog方法的实现
                struct rebinding nslog_rebinding = {"NSLog",redirect_nslog,(void*)&origin_nslog};
                struct rebinding rebs[] = {nslog_rebinding};
//        struct rebinding nslog_rebinding = {"ctest",ctest2,(void*)&origin_ctest};
//        struct rebinding rebs[] = {nslog_rebinding};
            rebind_symbols(rebs, 1);
//        ctest();
        //method2:
        //NSLog最后在输出的时候会用STDERR句柄进行错误系统日志的统计,
        //O_RDWR,可读可写打开 O_CREAT,若此文件不存在,则创建
        //dup2重定向之后,就不能在控制台看到日志了,一般在线上做日志统计,并上传
//        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//        path = [path stringByAppendingString:@"/log.txt"];
//        int fd = open(path.UTF8String, (O_RDWR|O_CREAT),0644);
//        dup2(fd, STDERR_FILENO);
//#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
