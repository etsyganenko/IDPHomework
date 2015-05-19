//
//  TSYEmployee.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"
#import "TSYCar.h"
#import "NSObject+TSYCategory.h"

@interface TSYEmployee ()
@property (nonatomic, retain)   NSMutableSet    *mutableObserversSet;

@end

@implementation TSYEmployee

@dynamic observersSet;

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
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = TSYEmployeeStateFree;
        self.mutableObserversSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)setState:(TSYEmployeeState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyOfStateWithSelector:[self selectorForState:state]];
    }
}

- (void)performWorkWithObject:(id)object {
    self.state = TSYEmployeeStateBusy;
    
    [self processObject:object];
    
    self.state = TSYEmployeeStateReadyForProcessing;    
    self.state = TSYEmployeeStateFree;
}

- (void)processObject:(id)object {
    
}

- (NSSet *)observersSet {
    return [[self.mutableObserversSet copy] autorelease];
}

#pragma mark -
#pragma mark TSYMoney

- (void)takeMoney:(NSUInteger)money fromObject:(TSYEmployee *)object {
    if (object.money < money) {
        NSLog(@"Not enough money!");
        return;
    }
    
    self.money += money;
    object.money -= money;
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
    for (TSYEmployee<TSYObserver> *observer in self.observersSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

- (SEL)selectorForState:(TSYEmployeeState)state {
    switch (state) {
        case TSYEmployeeStateFree:
            return @selector(employeeDidBecomeFree:);
            
        case TSYEmployeeStateReadyForProcessing:
            return @selector(employeeDidFinishWork:);
            
        case TSYEmployeeStateBusy:
            return nil;
    }
    
    return nil;
}

- (void)employeeDidFinishWork:(TSYEmployee *)employee {

}

@end
