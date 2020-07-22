//
//  NSObject+Common.h
//  LogNSNullRegex
//
//  Created by gelei on 2019/12/11.
//  Copyright © 2019 gelei. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Common)

- (void)say;
+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;
@end

NS_ASSUME_NONNULL_END
