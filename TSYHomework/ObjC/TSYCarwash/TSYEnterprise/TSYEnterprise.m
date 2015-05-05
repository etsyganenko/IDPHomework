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
#import "TSYAdministration.h"
#import "TSYCarwash.h"
#import "TSYCarwashRoom.h"
#import "TSYRoom.h"
#import "TSYCar.h"
#import "TSYAlphabet.h"

#import "NSObject+TSYCategory.h"
#import "NSString+TSYExtensions.h"

const NSUInteger administrationRoomsAmount      =   1;
const NSUInteger carwashRoomsAmount             =   1;
const NSUInteger carwashCarRoomsAmount          =   1;
const NSUInteger administrationEmployeesAmount  =   2;
const NSUInteger carwashEmployeesAmount         =   1;
const NSUInteger carwashCarsAmount              =   1;
const NSUInteger washerSalary                   =   5000;
const NSUInteger accountantSalary               =   7000;
const NSUInteger directorSalary                 =   10000;
const NSUInteger washingPrice                   =   60;

@interface TSYEnterprise ()
@property (nonatomic, retain) TSYAdministration *administration;
@property (nonatomic, retain) TSYCarwash        *carwash;

@property (nonatomic, retain) TSYRoom           *administrationRoom;
@property (nonatomic, retain) TSYCarwashRoom    *carwashRoom;

@property (nonatomic, retain) TSYDirector       *director;
@property (nonatomic, retain) NSMutableArray    *accountants;
@property (nonatomic, retain) NSMutableArray    *washers;

- (void)organizeStaff;
- (void)organizeBuildings;

- (TSYEmployee *)freeEmployeeInEmployees:(NSMutableArray *)employees;

@end

@implementation TSYEnterprise

+ (instancetype)enterprise {
    TSYEnterprise *enterprise = [TSYEnterprise object];
    
    return enterprise;
}

- (void)dealloc {
    self.administration = nil;
    self.carwash = nil;
    
    self.administrationRoom = nil;
    self.carwashRoom = nil;
    
    self.director = nil;
    self.accountants = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.washers = [NSMutableArray array];
    self.accountants = [NSMutableArray array];
    
    [self organizeStaff];
    [self organizeBuildings];
    
    return self;
}

- (void)organizeStaff {
    NSString *accountantName = [NSString randomStringWithLength:5 alphabet:[TSYAlphabet letterAlphabet]];
    NSString *directorName = [NSString randomStringWithLength:5 alphabet:[TSYAlphabet letterAlphabet]];
    NSString *washerName = [NSString randomStringWithLength:5 alphabet:[TSYAlphabet letterAlphabet]];

    
    TSYAccountant *accountant = [TSYAccountant employeeWithName:accountantName salary:accountantSalary];
    TSYWasher *washer = [TSYWasher employeeWithName:washerName salary:washerSalary];

    self.director = [TSYDirector employeeWithName:directorName salary:directorSalary];
    [self.washers addObject:washer];
    [self.accountants addObject:accountant];
    
    washer.price = washingPrice;
}

- (void)organizeBuildings {
    TSYWasher *washer = [self.washers objectAtIndex:0];
    TSYAccountant *accountant = [self.accountants objectAtIndex:0];
    self.administration = [TSYAdministration buildingWithRoomsAmount:administrationRoomsAmount];
    self.carwash = [TSYCarwash carwashWithRoomsAmount:carwashRoomsAmount
                                       carRoomsAmount:carwashCarRoomsAmount];
    
    self.administrationRoom = [TSYRoom roomWithPeopleCapacity:administrationEmployeesAmount];
    self.carwashRoom = [TSYCarwashRoom carwashRoomWithCarsCapacity:carwashCarsAmount
                                                    peopleCapacity:carwashEmployeesAmount];
    
    [self.administrationRoom addPerson:self.director];
    [self.administrationRoom addPerson:accountant];
    [self.carwashRoom addPerson:washer];
}

- (void)runCarwash:(TSYCar *)car {
    TSYAccountant *accountant = [self freeEmployeeInEmployees:self.accountants];
    TSYWasher *washer = [self freeEmployeeInEmployees:self.washers];

    TSYDirector *director = self.director;
    TSYCarwashRoom *box = self.carwashRoom;
    NSUInteger price = washer.price;
    
    [box addCar:car];
    
    [washer wash:car];
    [box removeCar:car];
    
    [car giveMoney:price toObject:washer];
    
    [washer giveMoney:price toObject:accountant];
    [accountant calculateMoney:price];
    
    [accountant giveMoney:price toObject:director];
    [director earnProfit];
}

- (TSYEmployee *)freeEmployeeInEmployees:(NSMutableArray *)employees {
    for (TSYEmployee *employee in employees) {
        if (employee.isFree) {
            return employee;
        }
    }
    
    return nil;
}

@end
