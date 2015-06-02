//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYMoneyProtocol.h"
#import "TSYObservableObject.h"

@class TSYCar;
@class TSYEmployee;

typedef NS_ENUM(NSUInteger, TSYEmployeeState) {
    TSYEmployeeStateFree,
    TSYEmployeeStateBusy,
    TSYEmployeeStateDidFinishWork
};

@protocol TSYEmployeeObserver <NSObject>

@optional
- (void)employeeDidFinishWork:(id<TSYEmployeeObserver>)employee;
- (void)employeeDidBecomeFree:(id<TSYEmployeeObserver>)employee;

@end

@interface TSYEmployee : TSYObservableObject<TSYMoneyProtocol, TSYEmployeeObserver>
@property (nonatomic, copy)     NSString            *name;
@property (nonatomic, assign)   NSUInteger          salary;
@property (nonatomic, assign)   NSUInteger          experience;

+ (instancetype)employeeWithName:(NSString *)name
                          salary:(NSUInteger)salary;

- (void)performWorkWithObject:(id)object;
- (void)processObject:(id)object;
- (void)finishProcessingObject:(id)object;

@end
