//
//  TSYCarGenerator.h
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYEnterprise;
@class TSYQueue;

@interface TSYCarGenerator : NSObject
@property (nonatomic, retain)   TSYEnterprise   *enterprise;
@property (nonatomic, assign)   NSUInteger      capacity;
@property (nonatomic, assign)   NSUInteger      money;

+ (instancetype)carGeneratorForEnterprise:(TSYEnterprise *)enterprise
                                withMoney:(NSUInteger)money
                                 capacity:(NSUInteger)capacity;

- (void)washCarsWithTimer:(NSTimer *)timer;

@end
