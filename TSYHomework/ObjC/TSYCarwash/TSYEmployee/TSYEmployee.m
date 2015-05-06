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

@implementation TSYEmployee

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
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.free = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)takeMoney:(NSUInteger)money fromObject:(TSYEmployee *)object {
    if (object.money < money) {
        NSLog(@"Not enough money!");
        return;
    }
    
    self.money += money;
    object.money -= money;
}

@end
