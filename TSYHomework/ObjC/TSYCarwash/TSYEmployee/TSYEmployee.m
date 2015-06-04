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

static const NSUInteger TSYSleepingTime =  500000;

@interface TSYEmployee ()
@property (nonatomic, retain) TSYQueue    *mutableQueue;

- (BOOL)shouldNotifyWithState:(NSUInteger)state;

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
    self.mutableQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = TSYEmployeeStateFree;
        self.mutableQueue = [TSYQueue queue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)queue {
    return [[self.mutableQueue copy] autorelease];
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
            [self.mutableQueue enqueue:object];
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
    [self processObject:object];
    
    usleep(arc4random_uniform(TSYSleepingTime));
    
    [self performSelectorOnMainThread:@selector(performWorkWithObjectOnMainThread:)
                           withObject:object
                        waitUntilDone:NO];
}

- (void)performWorkWithObjectOnMainThread:(id)object {
    [self finishProcessingObject:object];

    self.state = TSYEmployeeStateDidFinishWork;
}

#pragma mark -
#pragma mark TSYObservableObject

- (BOOL)shouldNotify {
    return [self.mutableQueue isEmpty];
}

- (BOOL)shouldNotifyWithState:(NSUInteger)state {
//    if (TSYEmployeeStateFree == state && ![self.mutableQueue isEmpty]) {
//        return NO;
//    }
//    
//    return YES;
    
    return !(TSYEmployeeStateFree == state && ![self.mutableQueue isEmpty]);
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
        
            if ([self shouldNotifyWithState:state]) {
                [self notifyOfStateChange:state];
            } else {
                [self performWorkWithObject:[self.mutableQueue dequeue]];
            }
        }
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

- (BOOL)takeMoney:(NSUInteger)money fromObject:(TSYEmployee *)object {
    if ([object giveMoneyIfEnough:money]) {
        [self takeMoney:money];
        return YES;
    }
    return NO;
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
    }
}

- (BOOL)giveMoneyIfEnough:(NSUInteger)money {
    @synchronized (self) {
        if (self.money < money) {
            NSLog(@"Not enough money!");
            return NO;
        }
        
        self.money -= money;
        return YES;
    }
}

@end
