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

const NSUInteger TSYEmployeesAmount                 =   3;
const NSUInteger TSYAdministrationRoomsAmount       =   1;
const NSUInteger TSYCarwashRoomsAmount              =   1;
const NSUInteger TSYCarwashCarRoomsAmount           =   1;
const NSUInteger TSYAdministrationEmployeesAmount   =   2;
const NSUInteger TSYCarwashEmployeesAmount          =   1;
const NSUInteger TSYCarwashCarsAmount               =   1;
const NSUInteger TSYWasherSalary                    =   5000;
const NSUInteger TSYAccountantSalary                =   7000;
const NSUInteger TSYDirectorSalary                  =   10000;
const NSUInteger TSYWashingPrice                    =   60;

@interface TSYEnterprise ()
@property (nonatomic, retain) TSYBuilding       *administration;
@property (nonatomic, retain) TSYCarwash        *carwash;

@property (nonatomic, retain) TSYRoom           *administrationRoom;
@property (nonatomic, retain) TSYCarwashRoom    *carwashRoom;

@property (nonatomic, retain) NSMutableArray    *employees;

- (void)organizeStaff;
- (void)organizeBuildings;

- (id)freeEmployeeOfClass:(Class)class;

@end

@implementation TSYEnterprise

+ (instancetype)enterprise {
    TSYEnterprise *enterprise = [self object];
    
    return enterprise;
}

- (void)dealloc {
    self.administration = nil;
    self.carwash = nil;
    
    self.administrationRoom = nil;
    self.carwashRoom = nil;
    
    self.employees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.employees = [NSMutableArray array];
    
    [self organizeStaff];
    [self organizeBuildings];
    
    return self;
}

- (void)organizeStaff {
    NSString *accountantName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    NSString *directorName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    NSString *washerName = [NSString randomStringWithLength:5 alphabet:[NSString letterAlphabet]];
    
    TSYDirector *director = [TSYDirector employeeWithName:directorName salary:TSYDirectorSalary];
    TSYAccountant *accountant = [TSYAccountant employeeWithName:accountantName salary:TSYAccountantSalary];
    TSYWasher *washer = [TSYWasher employeeWithName:washerName salary:TSYWasherSalary];

    [self.employees addObject:director];
    [self.employees addObject:accountant];
    [self.employees addObject:washer];
    
    washer.price = TSYWashingPrice;
}

- (void)organizeBuildings {
    TSYWasher *washer = [self freeEmployeeOfClass:[TSYWasher class]];
    TSYAccountant *accountant = [self freeEmployeeOfClass:[TSYAccountant class]];
    TSYDirector *director = [self freeEmployeeOfClass:[TSYDirector class]];
    
    self.administration = [TSYBuilding buildingWithRoomsAmount:TSYAdministrationRoomsAmount];
    self.carwash = [TSYCarwash carwashWithRoomsAmount:TSYCarwashRoomsAmount
                                       carRoomsAmount:TSYCarwashCarRoomsAmount];
    
    self.administrationRoom = [TSYRoom roomWithPeopleCapacity:TSYAdministrationEmployeesAmount];
    self.carwashRoom = [TSYCarwashRoom carwashRoomWithCarsCapacity:TSYCarwashCarsAmount
                                                    peopleCapacity:TSYCarwashEmployeesAmount];
    
    [self.administrationRoom addPerson:director];
    [self.administrationRoom addPerson:accountant];
    [self.carwashRoom addPerson:washer];
}

- (void)runCarwash:(TSYCar *)car {
    TSYWasher *washer = [self freeEmployeeOfClass:[TSYWasher class]];
    TSYAccountant *accountant = [self freeEmployeeOfClass:[TSYAccountant class]];
    TSYDirector *director = [self freeEmployeeOfClass:[TSYDirector class]];
    
    TSYCarwashRoom *box = self.carwashRoom;
    
    [box addCar:car];
    [washer performWorkWithObject:car];
    [box removeCar:car];
    
    [accountant performWorkWithObject:washer];
    
    [director performWorkWithObject:accountant];
}

- (TSYEmployee *)freeEmployeeOfClass:(Class)class {
    for (TSYEmployee *employee in self.employees) {
        if ([employee class] == class) {
            return employee;
            break;
        }
    }
    
    return nil;
}

@end
