//
//  NSObject+Common.m
//  LogNSNullRegex
//
//  Created by gelei on 2019/12/11.
//  Copyright © 2019 gelei. All rights reserved.
//

#import "NSObject+Common.h"
#import <objc/runtime.h>

@implementation NSObject (Common)

- (void)say {
    NSLog(@"say %zu",class_getInstanceSize([self class]));
}

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSEL,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
