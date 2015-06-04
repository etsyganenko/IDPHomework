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
#import "NSString+TSYRandomName.h"

static const NSUInteger TSYWashersCount                     =   5;
static const NSUInteger TSYAccountantsCount                 =   3;
static const NSUInteger TSYWasherSalary                     =   5000;
static const NSUInteger TSYAccountantSalary                 =   7000;
static const NSUInteger TSYDirectorSalary                   =   10000;
static const NSUInteger TSYWashingPrice                     =   60;
static const NSUInteger TSYMinNameLength                    =   2;
static const NSUInteger TSYMaxNameLength                    =   5;

@interface TSYEnterprise ()
@property (nonatomic, retain)   TSYDirector     *director;

@property (nonatomic, retain)   TSYDispatcher   *washersDispatcher;
@property (nonatomic, retain)   TSYDispatcher   *accountantsDispatcher;

- (void)organizeStaff;

- (void)removeObservers;

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
    
    self.director = nil;
    self.washersDispatcher = nil;
    self.accountantsDispatcher = nil;
    
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
    TSYDispatcher *washersDispatcher = [TSYDispatcher dispatcher];
    TSYDispatcher *accountantsDispatcher = [TSYDispatcher dispatcher];
    
    self.washersDispatcher = washersDispatcher;
    self.accountantsDispatcher = accountantsDispatcher;
    
    for (NSUInteger index = 0; index < TSYWashersCount; index++) {
        TSYWasher *washer = [TSYWasher employeeWithName:[NSString randomNameWithMinLength:TSYMinNameLength
                                                                                maxLength:TSYMaxNameLength]
                                                 salary:TSYWasherSalary];
        washer.price = TSYWashingPrice;
        
        [washer addObserver:self];
        
        [washersDispatcher addEmployee:washer];
    }
    
    self.director = [TSYDirector employeeWithName:[NSString randomNameWithMinLength:TSYMinNameLength
                                                                          maxLength:TSYMaxNameLength]
                                           salary:TSYDirectorSalary];
    
    for (NSUInteger index = 0; index < TSYAccountantsCount; index++) {
        TSYAccountant *accountant = [TSYAccountant employeeWithName:[NSString randomNameWithMinLength:TSYMinNameLength
                                                                                            maxLength:TSYMaxNameLength]
                                                             salary:TSYAccountantSalary];
        
        [accountant addObserver:self.director];
        
        [accountantsDispatcher addEmployee:accountant];
    }
}

- (void)removeObservers {
    TSYDirector *director = self.director;
    
    NSArray *washers = [self.washersDispatcher employees];
    NSArray *accountants = [self.accountantsDispatcher employees];
    
    for (TSYWasher *washer in washers) {
        [washer removeObserver:self];
    }
    
    for (TSYAccountant *accountant in accountants) {
        [accountant removeObserver:director];
    }
}

@end
