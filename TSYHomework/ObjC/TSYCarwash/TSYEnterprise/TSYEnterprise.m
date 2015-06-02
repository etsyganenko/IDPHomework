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
#import "TSYQueue.h"
#import "TSYDispatcher.h"

#import "NSObject+TSYCategory.h"
#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYWashersCount                     =   5;
static const NSUInteger TSYAccountantsCount                 =   3;
static const NSUInteger TSYWasherSalary                     =   5000;
static const NSUInteger TSYAccountantSalary                 =   7000;
static const NSUInteger TSYDirectorSalary                   =   10000;
static const NSUInteger TSYWashingPrice                     =   60;

@interface TSYEnterprise ()
@property (nonatomic, retain)   TSYDirector     *director;

@property (nonatomic, retain)   TSYDispatcher   *washersDispatcher;
@property (nonatomic, retain)   TSYDispatcher   *accountantsDispatcher;

- (void)organizeStaff;

//- (void)removeObservers;
//
//- (id)employeesOfClass:(Class)class;

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
//    [self removeObservers];
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self organizeStaff];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar:(TSYCar *)car {
    [self.washersDispatcher processObject:car];
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidFinishWork:(TSYWasher *)washer {
    [self.accountantsDispatcher processObject:washer];
}

#pragma mark -
#pragma mark Private Methods

- (void)organizeStaff {
    self.washersDispatcher = [TSYDispatcher dispatcher];
    self.accountantsDispatcher = [TSYDispatcher dispatcher];
    
    TSYDispatcher *washersDispatcher = self.washersDispatcher;
    TSYDispatcher *accountantsDispatcher = self.accountantsDispatcher;
    
    for (NSUInteger index = 0; index < TSYWashersCount; index++) {
        NSString *washerName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
        
        TSYWasher *washer = [TSYWasher employeeWithName:washerName salary:TSYWasherSalary];
        washer.price = TSYWashingPrice;
        
        [washer addObserver:self];
        [washer addObserver:washersDispatcher];
        
        [washersDispatcher addEmployee:washer];
    }

    NSString *directorName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    
    self.director = [TSYDirector employeeWithName:directorName salary:TSYDirectorSalary];
    
    for (NSUInteger index = 0; index < TSYAccountantsCount; index++) {
        NSString *accountantName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
        
        TSYAccountant *accountant = [TSYAccountant employeeWithName:accountantName salary:TSYAccountantSalary];
        
        [accountant addObserver:self.director];
        [accountant addObserver:accountantsDispatcher];
        
        [accountantsDispatcher addEmployee:accountant];
    }
}

//- (void)removeObservers {
//    TSYAccountant *accountant = [[self employeesOfClass:[TSYAccountant class]] firstObject];
//    TSYDirector *director = [[self employeesOfClass:[TSYDirector class]] firstObject];
//    
//    [accountant removeObserver:director];
//    
//    NSArray *washers = [self employeesOfClass:[TSYWasher class]];
//    
//    for (TSYWasher *washer in washers) {
//        [washer removeObserver:self];
//        [washer removeObserver:accountant];
//    }
//}

//- (id)employeesOfClass:(Class)class {
//    NSMutableArray *result = [NSMutableArray array];
//    NSArray *employees = [NSArray array];
//    
//    @synchronized (self) {
//        employees = [[self.employees copy] autorelease];
//    }
//    
//    for (TSYEmployee *employee in employees) {
//        if ([employee isMemberOfClass:class]) {
//            [result addObject:employee];
//        }
//    }
//    
//    return result;
//}

@end
