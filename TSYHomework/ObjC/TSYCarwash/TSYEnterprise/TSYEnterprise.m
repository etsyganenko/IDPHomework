//
//  TSYEnterprise.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterprise.h"
#import "TSYDirector.h"
#import "TSYAccountant.h"
#import "TSYWasher.h"
#import "TSYCarwash.h"
#import "TSYCarwashRoom.h"
#import "TSYRoom.h"
#import "TSYCar.h"

#import "NSObject+TSYCategory.h"
#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYWashersCount                     =   5;
static const NSUInteger TSYWasherSalary                     =   5000;
static const NSUInteger TSYAccountantSalary                 =   7000;
static const NSUInteger TSYDirectorSalary                   =   10000;
static const NSUInteger TSYWashingPrice                     =   60;

@interface TSYEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *cars;
@property (nonatomic, retain)   NSMutableArray  *employees;

- (void)organizeStaff;

- (void)removeObservers;

- (id)freeEmployeeOfClass:(Class)class;
- (id)employeesOfClass:(Class)class;

@end

@implementation TSYEnterprise

#pragma mark -
#pragma mark Class Methods

+ (instancetype)enterprise {
    TSYEnterprise *enterprise = [self object];
    
    return enterprise;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObservers];
    
    self.employees = nil;
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.employees = [NSMutableArray array];
    self.cars = [NSMutableArray array];
    
    [self organizeStaff];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar:(TSYCar *)car {
    @synchronized (self) {
        TSYWasher *washer = [self freeEmployeeOfClass:[TSYWasher class]];
        
        if (washer) {
            [washer performWorkWithObject:car];
        } else {
            [self.cars addObject:car];
        }
    }
}

#pragma mark -
#pragma mark TSYObserver

- (void)employeeDidBecomeFree:(TSYWasher *)washer {
    @synchronized (self) {
        NSMutableArray *cars = self.cars;
        
        TSYCar *car = [[[cars firstObject] retain] autorelease];
        
        if (car) {
            [cars removeObject:car];
            [washer performWorkWithObject:car];
        }   
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)organizeStaff {
    NSMutableArray *employees = self.employees;
    
    NSString *accountantName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    NSString *directorName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    
    TSYAccountant *accountant = [TSYAccountant employeeWithName:accountantName salary:TSYAccountantSalary];
    TSYDirector *director = [TSYDirector employeeWithName:directorName salary:TSYDirectorSalary];
    
    [employees addObject:accountant];
    [employees addObject:director];
    
    [accountant addObserver:director];
    
    for (NSUInteger index = 0; index < TSYWashersCount; index++) {
        NSString *washerName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
        
        TSYWasher *washer = [TSYWasher employeeWithName:washerName salary:TSYWasherSalary];
        washer.price = TSYWashingPrice;
        
        [washer addObserver:self];
        [washer addObserver:accountant];
        
        [employees addObject:washer];
    }
}

- (void)removeObservers {
    TSYAccountant *accountant = [[self employeesOfClass:[TSYAccountant class]] firstObject];
    TSYDirector *director = [[self employeesOfClass:[TSYDirector class]] firstObject];
    
    [accountant removeObserver:director];
    
    NSArray *washers = [self employeesOfClass:[TSYWasher class]];
    
    for (TSYWasher *washer in washers) {
        [washer removeObserver:self];
        [washer removeObserver:accountant];
    }
}

- (id)freeEmployeeOfClass:(Class)class {
    for (TSYEmployee *employee in self.employees) {
        if ([employee class] == class && TSYEmployeeStateFree == employee.state) {
            return employee;
        }
    }
    
    return nil;
}

- (id)employeesOfClass:(Class)class {
    NSMutableArray *result = [NSMutableArray array];
    
    for (TSYEmployee *employee in self.employees) {
        if ([employee class] == class) {
            [result addObject:employee];
        }
    }
    
    return result;
}

@end
