//
//  TSYObservableObject.h
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface TSYObservableObject : NSObject
@property (atomic, assign)      TSYEmployeeState    state;
@property (nonatomic, readonly) NSSet               *observersSet;

// нужен???
- (instancetype)init;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (SEL)selectorForState:(TSYEmployeeState)state;

@end
