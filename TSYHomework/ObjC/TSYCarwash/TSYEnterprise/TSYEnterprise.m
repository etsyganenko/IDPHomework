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
static const NSUInteger TSYAdministrationEmployeesCount     =   2;
static const NSUInteger TSYCarwashCarsCount                 =   5;
static const NSUInteger TSYWasherSalary                     =   5000;
static const NSUInteger TSYAccountantSalary                 =   7000;
static const NSUInteger TSYDirectorSalary                   =   10000;
static const NSUInteger TSYWashingPrice                     =   60;

@interface TSYEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *cars;
@property (nonatomic, retain)   NSMutableArray  *employees;

- (void)organizeStaff;

- (id)freeEmployeeOfClass:(Class)class;

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
    [self.cars addObject:car];
    
    TSYWasher *washer = [self freeEmployeeOfClass:[TSYWasher class]];
    [washer performWorkWithObject:car];
    
    [self.cars removeObject:car];
}

#pragma mark -
#pragma mark TSYObserver

- (void)employeeDidBecomeFree:(TSYWasher *)washer {
    [washer performWorkWithObject:[self.cars firstObject]];
}

#pragma mark -
#pragma mark Private Methods

- (void)organizeStaff {
    NSString *accountantName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    NSString *directorName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    
    TSYAccountant *accountant = [TSYAccountant employeeWithName:accountantName salary:TSYAccountantSalary];
    TSYDirector *director = [TSYDirector employeeWithName:directorName salary:TSYDirectorSalary];
    
    for (NSUInteger index = 0; index < TSYWashersCount; index++) {
        NSString *washerName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
        
        TSYWasher *washer = [TSYWasher employeeWithName:washerName salary:TSYWasherSalary];
        washer.price = TSYWashingPrice;
        
        [washer addObserver:self];
        [washer addObserver:accountant];
        
        [self.employees addObject:washer];
    }
    
    [self.employees addObject:accountant];
    [self.employees addObject:director];
    
    [accountant addObserver:director];
}

- (TSYEmployee *)freeEmployeeOfClass:(Class)class {
    for (TSYEmployee *employee in self.employees) {
        if ([employee class] == class && TSYEmployeeStateFree == employee.state) {
            return employee;
            break;
        }
    }
    
    return nil;
}

@end
