//
//  TSYDispatcher.m
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYDispatcher.h"

#import "TSYQueue.h"

#import "NSObject+TSYCategory.h"

@interface TSYDispatcher ()
@property (nonatomic, retain)   NSMutableArray  *employees;
@property (nonatomic, retain)   TSYQueue        *queue;

- (void)processObject:(id)object withEmployee:(TSYEmployee *)employee;
- (id)freeEmployee;

@end

@implementation TSYDispatcher

@dynamic processors;

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

- (NSArray *)processors {
    return [[self.employees copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id)object {
    @synchronized (self) {
        TSYEmployee *employee = [self freeEmployee];
        
        [self processObject:object withEmployee:employee];
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

- (void)processObject:(id)object withEmployee:(TSYEmployee *)employee {
    if (employee) {
        [employee performWorkWithObject:object];
    } else {
        [self.queue enqueue:object];
    }
}

- (TSYEmployee *)freeEmployee {
    for (TSYEmployee *employee in self.employees) {
        if (TSYEmployeeStateFree == employee.state) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidBecomeFree:(TSYEmployee *)employee {
    @synchronized (self) {
        id object = [self.queue dequeue];
        
        if (object) {
            [employee performWorkWithObject:object];
        }
    }
}

@end
