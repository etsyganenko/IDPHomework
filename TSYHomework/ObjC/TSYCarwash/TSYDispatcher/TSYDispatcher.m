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

#import "NSObject+TSYCategory.h"

@interface TSYDispatcher ()
@property (nonatomic, assign)   NSMutableArray  *mutableEmployees;
@property (nonatomic, assign)   TSYQueue        *queue;

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

#pragma mark -
#pragma mark Public Methods

- (void)addEmployee:(TSYEmployee *)employee {
    
}

- (void)removeEmployee:(TSYEmployee *)employee {
    
}

#pragma mark -
#pragma mark Private Methods

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidFinishWork:(TSYEmployee *)employee {
    
}

- (void)employeeDidBecomeFree:(TSYEmployee *)employee {
    
}

@end
