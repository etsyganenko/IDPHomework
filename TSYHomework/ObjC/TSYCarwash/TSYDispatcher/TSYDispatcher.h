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

+ (instancetype)dispatcher;

- (instancetype)init;

- (void)processCar:(TSYCar *)car;

- (void)addEmployee:(TSYEmployee *)employee;
- (void)removeEmployee:(TSYEmployee *)employee;

@end
