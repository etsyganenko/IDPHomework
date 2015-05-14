//
//  TSYEmployee.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSYTakeMoney.h"

@class TSYCar;
@class TSYEmployee;

typedef NS_ENUM(NSUInteger, TSYEmployeeState) {
    TSYEmployeeStateFree,
    TSYEmployeeStateBusy
};

@protocol TSYDelegate <NSObject>

- (void)employeeDidFinishWork:(TSYEmployee *)employee;

@end

@protocol TSYObserver <NSObject>

- (void)employeeDidBecomeFree:(TSYEmployee *)employee;

@end

@interface TSYEmployee : NSObject<TSYTakeMoney, TSYDelegate, TSYObserver>
@property (nonatomic, copy)                     NSString            *name;
@property (nonatomic, assign)                   NSUInteger          salary;
@property (nonatomic, assign)                   NSUInteger          experience;
@property (nonatomic, assign)                   TSYEmployeeState    state;

@property (nonatomic, assign)                   id<TSYDelegate>     delegate;

@property (nonatomic, readonly)                 NSSet               *observersSet;

+ (instancetype)employeeWithName:(NSString *)name
                          salary:(NSUInteger)salary;

- (void)performWorkWithObject:(id)object;
- (void)processObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

@end
