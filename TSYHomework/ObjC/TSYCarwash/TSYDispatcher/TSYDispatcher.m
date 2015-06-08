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
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   TSYQueue        *queue;

- (void)processObject:(id)object withEmployee:(TSYEmployee *)employee;
- (id)freeEmployee;

@end

@implementation TSYDispatcher

@dynamic employees;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)dispatcher {
    return [self object];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableEmployees = [NSMutableArray array];
        self.queue = [TSYQueue queue];
    }

    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)employees {
    @synchronized (self) {
        return [[self.mutableEmployees copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id)object {
    @synchronized (self) {
        [self processObject:object withEmployee:[self freeEmployee]];
    }
}

- (void)addEmployee:(TSYEmployee *)employee {
    @synchronized (self) {
        [self.mutableEmployees addObject:employee];
        [employee addObserver:self];
    }
}

- (void)removeEmployee:(TSYEmployee *)employee {
    @synchronized (self) {
        [employee removeObserver:self];
        [self.mutableEmployees removeObject:employee];
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
    for (TSYEmployee *employee in self.mutableEmployees) {
        if (TSYEmployeeStateFree == employee.state) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidBecomeFree:(TSYEmployee *)employee {
    @synchronized (employee) {
        if (TSYEmployeeStateFree == employee.state) {
            id object = [self.queue dequeue];

            if (object) {
                [employee performWorkWithObject:object];
            }
        }
    }
}

@end
