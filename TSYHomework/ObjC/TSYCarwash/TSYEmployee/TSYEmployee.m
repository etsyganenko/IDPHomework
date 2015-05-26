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

@dynamic observersSet;

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

- (void)setState:(TSYEmployeeState)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
            [self notifyOfStateWithSelector:[self selectorForState:state]];
        }
    }
}

- (TSYEmployeeState)state {
    @synchronized (self) {
        return _state;
    }
}

- (TSYQueue *)queue {
    return [[self.subordinates copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
    if (TSYEmployeeStateFree == self.state) {
        self.state = TSYEmployeeStateBusy;
        
        self.processedObject = object;
    
        [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                               withObject:object];
    } else {
        [self.subordinates enqueue:object];
    }
}

- (void)performWorkWithObjectInBackground:(id)object {
    @synchronized (self) {
        [self processObject:object];
        
        [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:)
                               withObject:object
                            waitUntilDone:NO];
    }
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    @synchronized (self) {
        self.processedObject = nil;
        
        [self finishProcessingObject:object];
    }
}

- (void)finishProcessingObject:(TSYEmployee *)employee {
    @synchronized (self) {
        employee.state = TSYEmployeeStateFree;
        
        if (![self.subordinates isEmpty]) {
            [self performSelectorInBackground:@selector(performWorkWithObjectInBackground:)
                                   withObject:[self.subordinates dequeue]];
        } else {
            self.state = TSYEmployeeStateDidFinishWork;
        }
    }
}

- (void)processObject:(id)object {

}

- (NSSet *)observersSet {
    return [[self.mutableObserversSet copy] autorelease];
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
#pragma mark TSYObserver

- (void)addObserver:(id)observer {
    [self.mutableObserversSet addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObserversSet removeObject:observer];
}

- (void)notifyOfStateWithSelector:(SEL)selector {
    if (NULL == selector) {
        return;
    }
    
    for (id observer in self.observersSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (SEL)selectorForState:(TSYEmployeeState)state {
    switch (state) {
        case TSYEmployeeStateFree:
            return @selector(employeeDidBecomeFree:);
            
        case TSYEmployeeStateDidFinishWork:
            return @selector(employeeDidFinishWork:);
            
        default:
            return NULL;
    }
}

- (void)employeeDidFinishWork:(TSYEmployee *)employee {
    @synchronized (self) {
        [self performWorkWithObject:employee];
    }
}

@end
