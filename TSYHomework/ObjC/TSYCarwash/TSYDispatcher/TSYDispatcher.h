//
//  TSYDispatcher.h
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYEmployee.h"

@class TSYQueue;

@interface TSYDispatcher : NSObject<TSYEmployeeObserver>
@property (nonatomic, readonly)   NSArray  *processors;

+ (instancetype)dispatcher;

- (void)processObject:(id)object;

- (void)addEmployee:(TSYEmployee *)employee;
- (void)removeEmployee:(TSYEmployee *)employee;

- (NSArray *)processors;

@end
