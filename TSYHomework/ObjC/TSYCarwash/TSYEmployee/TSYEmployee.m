//
//  TSYEmployee.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEmployee.h"

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

@end
