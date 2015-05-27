//
//  TSYDispatcher.m
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYDispatcher.h"

#import "TSYQueue.h"
#import "TSYCar.h"
#import "TSYWasher.h"

#import "NSObject+TSYCategory.h"

@interface TSYDispatcher ()
@property (nonatomic, assign)   NSMutableArray  *employees;
@property (nonatomic, assign)   TSYQueue        *queue;

- (id)freeEmployeeOfClass:(Class)class;

@end

@implementation TSYDispatcher

#pragma mark -
#pragma mark Class Methods

+ (instancetype)dispatcher {
    TSYDispatcher *dispatcher = [self object];
    
    return dispatcher;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    self.employees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.employees = [NSMutableArray array];
        self.queue = [TSYQueue queue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

#pragma mark -
#pragma mark Public Methods

- (void)processCar:(TSYCar *)car {
    @synchronized (self) {
        TSYWasher *washer = [self freeEmployeeOfClass:[TSYWasher class]];
        
        if (washer) {
            [washer performWorkWithObject:car];
        } else {
            [self.queue enqueue:car];
        }
    }
}

- (void)addEmployee:(TSYEmployee *)employee {
    @synchronized (self) {
        [self.employees addObject:employee];
    }
}

- (void)removeEmployee:(TSYEmployee *)employee {
    @synchronized (self) {
        [self.employees removeObject:employee];
    }
}

#pragma mark -
#pragma mark Private Methods

- (id)freeEmployeeOfClass:(Class)class {
    NSArray *employees = nil;
    
    @synchronized (self) {
        employees = self.employees;
    }
    
    for (TSYEmployee *employee in employees) {
        if ([employee class] == class && TSYEmployeeStateFree == employee.state) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidFinishWork:(TSYEmployee *)employee {
    
}

- (void)employeeDidBecomeFree:(TSYEmployee *)employee {
    
}

@end
