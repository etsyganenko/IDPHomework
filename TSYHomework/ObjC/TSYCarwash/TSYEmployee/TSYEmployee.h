//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSYMoneyProtocol.h"

@class TSYCar;
@class TSYEmployee;

typedef NS_ENUM(NSUInteger, TSYEmployeeState) {
    TSYEmployeeStateFree,
    TSYEmployeeStateBusy,
    TSYEmployeeStateDidFinishWork
};

@protocol TSYObserver <NSObject>

@optional
- (void)employeeDidFinishWork:(TSYEmployee *)employee;
- (void)employeeDidBecomeFree:(TSYEmployee *)employee;

@end

@interface TSYEmployee : NSObject<TSYMoneyProtocol, TSYObserver>
@property (nonatomic, copy)     NSString            *name;
@property (nonatomic, assign)   NSUInteger          salary;
@property (nonatomic, assign)   NSUInteger          experience;
@property (atomic, assign)      TSYEmployeeState    state;

@property (nonatomic, readonly) NSSet               *observersSet;

@property (nonatomic, retain)   NSObject            *processedObject;

+ (instancetype)employeeWithName:(NSString *)name
                          salary:(NSUInteger)salary;

- (void)performWorkWithObject:(id)object;
- (void)processObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (SEL)selectorForState:(TSYEmployeeState)state;

@end
