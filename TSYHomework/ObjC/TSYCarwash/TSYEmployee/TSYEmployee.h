//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSYMoney.h"

@class TSYCar;
@class TSYEmployee;

typedef NS_ENUM(NSUInteger, TSYEmployeeState) {
    TSYEmployeeStateFree,
    TSYEmployeeStateBusy,
    TSYEmployeeStateReadyForProcessing
};

@protocol TSYObserver <NSObject>

@optional
- (void)employeeDidFinishWork:(TSYEmployee *)employee;
- (void)employeeDidBecomeFree:(TSYEmployee *)employee;

@end

@interface TSYEmployee : NSObject<TSYMoney, TSYObserver>
@property (nonatomic, copy)                     NSString            *name;
@property (nonatomic, assign)                   NSUInteger          salary;
@property (nonatomic, assign)                   NSUInteger          experience;
@property (nonatomic, assign)                   TSYEmployeeState    state;

@property (nonatomic, readonly)                 NSSet               *observersSet;

+ (instancetype)employeeWithName:(NSString *)name
                          salary:(NSUInteger)salary;

- (void)performWorkWithObject:(id)object;
- (void)processObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (SEL)selectorForState:(TSYEmployeeState)state;

@end
