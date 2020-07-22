//
//  GLViewController.m
//  LogNSNullRegex
//
//  Created by gelei on 2019/8/2.
//  Copyright © 2019 gelei. All rights reserved.
//

#import "TTViewController.h"
#import "NSString+JCRegexHelper.h"
#import <RegexKitLite.h>
#import <Lottie/Lottie.h>
#import <SobotKit/SobotKit.h>
#import "RSAObjC.h"
#import "NSData+Base64.h"
#import <AFNetworking/AFNetworking.h>
#import "SDTri.h"
#import "TTBMTimer.h"
#import "Pserson.h"
#import "Student.h"
#import <objc/runtime.h>

@interface GLViewController ()<ZCChatControllerDelegate,MTKViewDelegate>
/** Lot动画 */
@property (nonatomic, strong) LOTAnimationView *animation;
@property (nonatomic, strong) id<MTLCommandQueue> commandQueue;
/** 自定义timer */
@property (nonatomic, strong) GLBMTimer *timer;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) dispatch_queue_t queue;
@property (atomic, assign) NSInteger intA;
@end

@implementation GLViewController

+ (void)load{
    NSLog(@"%@", self);
}

- (void)injected {
    NSLog(@"*******injected******");
//        [self updateUI];
    //
    //调试代码
        [self nulltest];
    [self regTest];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self nulltest];
    [self testAttributeSize];
    [Student new];
    [Pserson say];
    NSDictionary *dic = @{
        @"zhangsan":@"张三",
        @"lisi":@"里斯",
        @"wangwu":@"王武",
        @"zhaoliu":@"赵六"
    };
    NSLog(@"%@",dic.allKeys);
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTest:) name:@"ceshi" object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationTest:) name:@"ceshi" object:nil];
//    NSDictionary *dic = @{@"a":@1,@"b":@2};
//    self.queue = dispatch_queue_create("custome", DISPATCH_QUEUE_SERIAL);
    //MTLDevice 表示GPU
//    id<MTLDevice> device =  MTLCreateSystemDefaultDevice();
//    MTKView *mtkview = [[MTKView alloc] initWithFrame:CGRectMake(50, 100, 200, 100) device:device];
//    //fps
////    mtkview.preferredFramesPerSecond = 60;
//    mtkview.delegate = self;
//    [self.view addSubview:mtkview];
//
    //与gpu交互的第一个对象 MTLCommandQueue
//    _commandQueue = [device newCommandQueue];
    //使用_commandQueue创建和组织MTLCommandBuffer对象,确保他们以正确的顺序发送到
}

- (void)notificationTest:(NSNotification *)notification {
    NSLog(@"111\n%@\n%@\n%@",notification,notification.name,notification.userInfo);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/*!
 每当窗口大戏哦啊发生变化或发生重新布局时,
 */
- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
    NSLog(@"drawableSizeWillChange*");
}

/*!
 每当需要渲染新帧时,由视图的preferredFramesPerSecond属性上设置的帧速率,此回调通常是开始执行渲染循环的主要事件
 */
- (void)drawInMTKView:(nonnull MTKView *)view {
    //渲染循环开始
    //_commandQueue ——>commandBuffer ↘️
    //                                  renderEncoder
    //          view-->renderPassDes ↗️

    NSLog(@"drawInMTKView*");
    //对于每帧,创建一个新的MTLCommandBuffer对象,并填充由gpu执行
    id<MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
    //MetalKit为每个帧创建一个新的MTLRenderPassDescriptor(渲染过程描述符)对象
    MTLRenderPassDescriptor *renderPassDes = view.currentRenderPassDescriptor;
    
        //有许多不同类型的gpu,每个gpu都以自己独特的方式接受和解释命令,MTLCommandBuffer对象将这些命令合并为单个提交,但必须首先使用
    //    MTLCommandEncoder对象以设备无关的方式对他们进行编码.有几种不同类型的MTLCommandEncoder类,每种类用于在gpu上执行不同类型的任务
        //MTLRenderCommandEncoder
    if (renderPassDes) {
        //渲染命令,编码此commandEncoder对象中的命令呈现给视图的drawable,默认情况下,创建
        id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDes];
        //指示编码器已完成
        [renderEncoder endEncoding];
        view.clearColor = MTLClearColorMake(arc4random_uniform(255/255.f), arc4random_uniform(255/255.f), arc4random_uniform(255/255.f), arc4random_uniform(255/255.f));
        [commandBuffer presentDrawable:view.currentDrawable];
        [commandBuffer commit];
    }
}

- (void)dealloc {
    NSLog(@"dealloc");
}

void reverseStr(char *chr){
    char *begin = chr;
    char *end = chr + strlen(chr) - 1;
    while (begin < end) {
        char temp = *begin;
        *(begin ++) = *end;
        *(end --) = temp;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [NSThread sleepForTimeInterval:4];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ceshi" object:nil];
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(self.queue, ^{
//            NSLog(@"%d   @@@@ %@",i,[NSThread currentThread]);
//        });
//    }
//
    
//    NSLog(@"xxx%d",[(id)[NSObject class] isKindOfClass:[NSObject class]]);
//    NSLog(@"xxx%d",[(id)[NSObject class] isMemberOfClass:[NSObject class]]);
//    NSLog(@"xxx%d",[(id)[Pserson class] isKindOfClass:[Pserson class]]);
//    NSLog(@"xxx%d",[(id)[Pserson class] isMemberOfClass:[Pserson class]]);
//     char ch[] = "hello world!";
//       reverseStr(ch);
//       printf("C reverse result is %s \n",ch);
//    self.intA = 0;
//    //开启一个线程对intA的值+1
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       for (int i = 0;i < 1000;i ++){
//           self.intA = self.intA + 1;
//       }
//       NSLog(@"intA : %ld",(long)self.intA);
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       for (int i = 0;i < 1000;i ++){
//           self.intA = self.intA + 1;
//       }
//       NSLog(@"intA : %ld",(long)self.intA);
//    });
    
//    NSLog(@"aa==%@",[[@"1234" dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0]);
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
//    NSString *p_path = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
//    NSString *resutl = [RSAEncryptor encryptString:@"0123456789abcdef" publicKeyWithContentsOfFile:path];
//
//    NSLog(@"result = %@",resutl);
//
//
//
//    NSString *deresult = [RSAEncryptor decryptString:resutl privateKeyWithContentsOfFile:p_path password:@""];
//    NSLog(@"deresult = %@",deresult);
    
    //GLBMTimer测试
//    if (self.page == 0) {
//        GLViewController *vc = [[GLViewController alloc] init];
//        vc.page = 1;
//        [self.navigationController pushViewController:vc animated:YES];
//        return;
//    }
//    if (self.timer) {
//        [self.timer cancel];
//        self.timer = nil;
//    }
//    __weak typeof(self) weakself = self;
//    self.timer = [GLBMTimer timerWithTimeInterval:2 block:^{
////        weakself.index++;
//        NSLog(@"%@",[NSThread currentThread]);
//    }];
//
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"%@_%d",[NSThread currentThread],i);
//        });
//    }
    [self dispatch_barrier];
}

- (void)dispatch_barrier {
    
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
//    for (int i = 0; i < 10; i++) {
////        dispatch_sync(concurrentQueue, ^{
////            NSLog(@"%d %@",i,[NSThread currentThread]);
////        });
//        dispatch_barrier_async(concurrentQueue, ^{
//            NSLog(@"%d %@",i,[NSThread currentThread]);
//        });
//    }
    NSLog(@"xxxx");
    dispatch_async(concurrentQueue, ^(){
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch-1");
    });
    dispatch_async(concurrentQueue, ^(){
        [NSThread sleepForTimeInterval:2];
        NSLog(@"dispatch-2");
    });
    dispatch_barrier_async(concurrentQueue, ^(){
        NSLog(@"dispatch-barrier-1+2");
    });
    dispatch_async(concurrentQueue, ^(){
        [NSThread sleepForTimeInterval:2];
        NSLog(@"dispatch-3");
    });
    dispatch_async(concurrentQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"dispatch-barrier-1+2+3");
    });
//    dispatch_async(concurrentQueue, ^(){
//        NSLog(@"dispatch-4");
//    });
}

- (void)testAttributeSize {
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 350, 20)];
    testLabel.numberOfLines = 0;
    testLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testLabel];
//    NSString * htmlString = @"舒适的房间散发撒地方阿斯顿发的啥饭打发的说法 大法师地方阿斯顿发生方式啊肯定是减肥";
    NSString * htmlString = @"<p>辅导费发放方式德弗里斯反对就;</p><a href=\"www.baidu.com\">点击</a><p>舒适的房间啊肯定是减肥</p>";
    
//    NSString * htmlString = @"<html><body> Some html string <br/> <font size=\"13\" color=\"red\">This is some text!</font> </body></html>";
    NSDictionary *attributes = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
     
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:attributes documentAttributes:nil error:nil];
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(350, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    testLabel.frame = CGRectMake(10, 250, 350, rect.size.height);
     
    testLabel.attributedText = attrStr;
}

- (NSString *)randomKey: (int)len {
    char ch[len];
    for (int index=0; index<len; index++) {
        
        int num = arc4random_uniform(75)+48;
        if (num>57 && num<65) { num = num%57+48; }
        else if (num>90 && num<97) { num = num%90+65; }
        ch[index] = num;
    }
    return [[NSString alloc] initWithBytes:ch length:len encoding:NSUTF8StringEncoding];
}


- (void)nulltest {
    id null = [NSNull null];
    if ([null isKindOfClass:[NSNull class]]) {
        NSLog(@"22");
    }
    NSLog(@"111");
}
////发送商品信息
- (void)sendProduct {
    //手动调用直接发送商品卡片
    ZCProductInfo *productInfo = [ZCProductInfo new];
    productInfo.thumbUrl = @"https://upload-images.jianshu.io/upload_images/5361063-e413832da0038304.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/800";
    productInfo.title = @"标题";
    productInfo.desc = @"摘要";
    productInfo.label = @"标签";
    productInfo.link = @"www.baidu.com";
    [ZCSobot sendProductInfo:productInfo];
}

- (void)startZcClient {
    //配置UI
    ZCKitInfo *uiInfo=[ZCKitInfo new];
    // 是否显示转人工按钮
    uiInfo.isShowTansfer = YES;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    ZCLibCusMenu *menu1 = [[ZCLibCusMenu alloc] init];
    menu1.title = [NSString stringWithFormat:@"订单"];
    menu1.url = [NSString stringWithFormat:@"sobot://sendOrderMsg"];;
    menu1.imgName = @"zcicon_sendpictures";
    [arr addObject:menu1];
    
    uiInfo.cusMoreArray = arr;
    
    [ZCSobot startZCChatVC:uiInfo with:self target:self pageBlock:^(id object, ZCPageBlockType type) {
        // 点击返回
        if(type==ZCPageBlockGoBack){
            //                    NSLog(@"点击了关闭按钮");
        }
        
        // 页面UI初始化完成，可以获取UIView，自定义UI
        if(type==ZCPageBlockLoadFinish){
            //                    NSLog(@"页面加载完成");
        }
    } messageLinkClick:^(NSString *link) {
        if( [link hasPrefix:@"sobot://sendOrderMsg"]){
            // 发送位置信息
//            [ZCSobot sendeOrderMsg:@"订单号：123456789012\n商品1：瓜子200g*1\n商品链接：www.sobot.com商品描述：恰恰瓜子恰恰瓜子恰恰瓜子\n恰恰瓜子恰恰瓜子恰恰瓜子恰恰瓜子...\n商品2：矿泉水500ml*12\n商品链接：www.sobot.com商品描述:..."];
            return YES;
        }
        return NO;
    }];
}

- (void)setupUI {
    self.animation = [LOTAnimationView animationNamed:@"27-loading" inBundle:[NSBundle mainBundle]];
    self.animation.frame = CGRectMake(50, 50, 100, 100);
    self.animation.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animation];
    [self.animation playWithCompletion:^(BOOL animationFinished) {
        [self.animation removeFromSuperview];
    }];
}

- (void)regTest {
    NSString *test1 = @"<H1>Chapter 1 - 介绍正则表达式</H1>";
    NSString *test2 = @"Chapter 123 测试";
    NSString *test3 = @"abcd******efghij";
    NSString *test4 = @"Is is the cost of of gasoline going up up";
    NSString *test5 = @"http://www.runoob.com:80/html/html-tutorial.html";
    NSString *test6 = @"Windows2000Windows98";
    NSString *test7 = @"Windows31";
    //贪婪匹配,会从最开始的 < 匹配到最后的 >
    NSString *reg1 = @"<.*>";
    //非贪婪匹配,但是会匹配出两个结果
    NSString *reg2 = @"<.*?>";
    //非贪婪匹配,只匹配前面一个<H1>,iOS字符串中的\需要转义
    NSString *reg3 = @"<\\w+?>";
    NSString *reg4 = @"^Chapter [1-9][0-9]?";
    NSString *reg5 = @"\\**";
    NSString *reg6 = @"/\b([a-z]+) \1\b/ig";
    //(pattern)匹配并获取这一匹配
    //(?:pattern)匹配但不获取结果
    NSString *reg7 = @"(?:\\w+):\\/\\/([^/:]+)(?::\\d*)?([^# ]*)";
    NSString *reg8 = @"(\\w+):\\/\\/([^/:]+)(:\\d*)?([^# ]*)";
    NSString *reg9 = @"Windows(?=95|98|NT|2000)";
    NSArray<NSTextCheckingResult*> *matchs1 = [test1 matchesWithRegex:reg1];
    NSArray<NSTextCheckingResult*> *matchs2 = [test1 matchesWithRegex:reg2];
    NSArray<NSTextCheckingResult*> *matchs3 = [test1 matchesWithRegex:reg3];
    NSArray<NSTextCheckingResult*> *matchs4 = [test2 matchesWithRegex:reg4];
    NSArray *matchs5 = [test3 componentsMatchedByRegex:reg5];
    NSArray *matchs6 = [test5 arrayOfCaptureComponentsMatchedByRegex:reg7];
    NSArray *matchs7 = [test5 arrayOfCaptureComponentsMatchedByRegex:reg8];
    NSArray *matchs8 = [test6 arrayOfCaptureComponentsMatchedByRegex:reg9];
    NSArray *matchs9 = [test7 arrayOfCaptureComponentsMatchedByRegex:reg9];
    for (NSTextCheckingResult *match in matchs1) {
        NSLog(@"matchs1***%@",NSStringFromRange(match.range));
    }

    for (NSTextCheckingResult *match in matchs2) {
        NSLog(@"matchs2***%@",NSStringFromRange(match.range));
    }

    for (NSTextCheckingResult *match in matchs3) {
        NSLog(@"matchs3***%@",NSStringFromRange(match.range));
    }
    for (NSTextCheckingResult *match in matchs4) {
        NSLog(@"matchs4***%@",NSStringFromRange(match.range));
    }

    for (id match in matchs5) {
        NSLog(@"matchs5===%@",match);
    }

    for (id match in matchs6) {
        NSLog(@"matchs6===%@",match);
    }
    for (id match in matchs7) {
        NSLog(@"matchs7===%@",match);
    }

    NSLog(@"matchs8===%@",matchs8);
    NSLog(@"matchs9===%@",matchs9);


    NSString *urlStr = @"http://aaa.123.cn哈哈xiaofanwww.baidu.com肖";
    NSString *urlReg = @"((https?:\\/\\/|www)[a-zA-Z0-9.]*(:\\d*)?[a-zA-Z0-9]*)+";
    NSArray<NSTextCheckingResult*> *urlMatchs = [urlStr matchesWithRegex:urlReg];
    for (NSTextCheckingResult *match in urlMatchs) {
        NSLog(@"matchURl***%@",NSStringFromRange(match.range));
    }
}

- (void)openLeaveMsgClick:(NSString*)tipMsg {
    NSLog(@"tipMsg=%@",tipMsg);
}

@end

@implementation GLViewController1

@end

@implementation GLViewController2

@end
