//
//  TSYEmployee.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"
#import "TSYCar.h"
#import "TSYQueue.h"

#import "NSObject+TSYCategory.h"

@interface TSYEmployee ()
@property (nonatomic, retain)       NSMutableSet    *mutableObserversSet;
@property (nonatomic, readwrite)    TSYQueue        *subordinates;

@end

@implementation TSYEmployee

@synthesize money   = _money;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employeeWithName:(NSString *)name
                           salary:(NSUInteger)salary
{
    TSYEmployee *employee = [self object];
    
    employee.name = name;
    employee.salary = salary;
    
    return employee;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableObserversSet = nil;
    self.subordinates = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = TSYEmployeeStateFree;
        self.mutableObserversSet = [NSMutableSet set];
        self.subordinates = [TSYQueue queue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (TSYQueue *)queue {
    return [[self.subordinates copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
    @synchronized (self) {
        if (TSYEmployeeStateFree == self.state) {
            self.state = TSYEmployeeStateBusy;
            
            [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                                   withObject:object];
        } else {
            [self.subordinates enqueue:object];
        }
    }
}

- (void)performWorkWithObjectInBackground:(id)object {
    self.processedObject = object;
    
    [self processObject:object];
    
    [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    self.processedObject = nil;
    
    [self finishProcessingObject:object];
    
    TSYQueue *subordinates = self.subordinates;
    
    if (![subordinates isEmpty]) {
        [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                               withObject:[subordinates dequeue]];
    } else {
        self.state = TSYEmployeeStateDidFinishWork;
    }
}

- (void)finishProcessingObject:(TSYEmployee *)employee {
    @synchronized (self) {
        employee.state = TSYEmployeeStateFree;
    }
}

- (void)processObject:(id)object {

}

#pragma mark -
#pragma mark TSYMoneyProtocol

- (void)takeMoney:(NSUInteger)money fromObject:(TSYEmployee *)object {
    @synchronized (object) {
        if (object.money < money) {
            NSLog(@"Not enough money!");
            return;
        }
        
        object.money -= money;
    }
    
    @synchronized (self) {
        self.money += money;
    }
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidFinishWork:(TSYEmployee *)employee {
    @synchronized (self) {
        [self performWorkWithObject:employee];
    }
}

@end
