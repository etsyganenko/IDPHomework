//
//  TSYEmployee.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"

#import "TSYCar.h"

@implementation TSYEmployee

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employeeWithName:(NSString *)name
                           salary:(NSUInteger)salary
{
    TSYEmployee *employee = [[[self alloc] init] autorelease];
    
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

#pragma mark -
#pragma mark Public Methods

- (void)takeMoneyFromCar:(NSUInteger)money car:(TSYCar *)car {
    if (car.money < money) {
        NSLog(@"Not enough money!");
        return;
    }
    
    self.money += money;
    car.money -= money;
}

- (void)takeMoneyFromEmployee:(NSUInteger)money employee:(TSYEmployee *)employee {
    if (employee.money < money) {
        NSLog(@"Not enough money!");
        return;
    }
    
    self.money += money;
    employee.money -= money;
}

@end
