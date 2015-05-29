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
@property (nonatomic, readwrite)    TSYQueue        *subordinates;

@end

@implementation TSYEmployee

@dynamic queue;

@synthesize money   = _money;
@synthesize state   = _state;

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
    self.subordinates = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = TSYEmployeeStateFree;
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

- (void)finishProcessingObject:(TSYEmployee *)employee {
    employee.state = TSYEmployeeStateFree;
}

- (void)processObject:(id)object {

}

#pragma mark -
#pragma mark Private Methods

- (void)performWorkWithObjectInBackground:(id)object {
    self.processedObject = object;
    
    [self processObject:object];
    
    [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    [self finishProcessingObject:object];
    
    self.processedObject = nil;
    
    @synchronized (self) {
        TSYEmployee *subordinate = [self.subordinates dequeue];
        
        if (subordinate) {
            [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                                   withObject:subordinate];
        } else {
            self.state = TSYEmployeeStateDidFinishWork;
        }
    }
}

#pragma mark -
#pragma mark TSYObservableObject

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
            if (TSYEmployeeStateFree == state) {
                [self checkQueueBeforeNotifying];
            } else {
                [self notifyOfStateChange:state];
            }
        }
    }
}

- (void)checkQueueBeforeNotifying {
    TSYEmployee *subordinate = [self.subordinates dequeue];
    
    if (subordinate) {
        [self performWorkWithObject:subordinate];
    } else {
        [self notifyOfStateChange:_state];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYEmployeeStateFree:
            return @selector(employeeDidBecomeFree:);
            
        case TSYEmployeeStateDidFinishWork:
            return @selector(employeeDidFinishWork:);
            
        default:
            return [super selectorForState:state];
    }
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
    [self performWorkWithObject:employee];
}

@end
