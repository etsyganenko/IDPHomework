//
//  TSYCarGenerator.h
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYEnterprise;

@interface TSYCarGenerator : NSObject

+ (instancetype)carGeneratorForEnterprise:(TSYEnterprise *)enterprise
                                withMoney:(NSUInteger)money
                                 capacity:(NSUInteger)capacity;

- (void)start;
- (void)stop;

@end
