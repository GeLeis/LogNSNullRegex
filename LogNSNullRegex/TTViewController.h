
#import <UIKit/UIKit.h>
#import <Lottie/Lottie.h>
#import <SobotKit/SobotKit.h>
#import "RSAObjC.h"
#import "NSData+Base64.h"
#import <AFNetworking/AFNetworking.h>
#import "SDTri.h"
#import "TTBMTimer.h"
#import "Pserson.h"

@interface GLViewController : UIViewController
/** page
 */
//测试
@property (nonatomic, assign) int page;

//page1111
//ceshi 2
@property (nonatomic, assign) int page1;

///pages3
@property (nonatomic, assign) int page2;

/// ceshi
@property (nonatomic, assign) int page3;

/** ceshi */
- (void)methodA;

//测试
- (void)methodB:(int)a tst:(NSString *)name;

/// 1
/// @param a 1
/// @param name 1
+ (void)methodC:(int)a tst:(NSString *)name;

///测试2
+ (void)methodD;

@end

@interface GLViewController1 : UIViewController
/** page
 */
//测试
@property (nonatomic, assign) int page;

//page1111
//ceshi 2
@property (nonatomic, assign) int page1;

///pages3
@property (nonatomic, assign) int page2;

/// ceshi
@property (nonatomic, assign) int page3;

@end

@interface GLViewController2 : UIViewController

@property (nonatomic, assign) int page;

@end


