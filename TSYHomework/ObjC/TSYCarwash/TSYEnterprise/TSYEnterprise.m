//
//  TSYEnterprise.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterprise.h"

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
    self.accountant = nil;
    self.washer = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self organizeStaff];
    [self organizeBuildings];
    
    return self;
}

- (void)organizeStaff {
    self.director = [TSYDirector employeeWithName:@"Mihal Mihalych" salary:10000];
    self.accountant = [TSYAccountant employeeWithName:@"Anton" salary:7000];
    self.washer = [TSYWasher employeeWithName:@"Ivan" salary:5000];
}

- (void)organizeBuildings {
    self.administration = [TSYAdministration buildingWithRoomsAmount:1];
    self.carwash = [TSYCarwash carwashWithRoomsAmount:1 carRoomsAmount:1];
    
    self.administrationRoom = [TSYRoom roomWithPeopleCapacity:2];
    self.carwashRoom = [TSYCarwashRoom carwashRoomWithCarsCapacity:1 peopleCapacity:1];
    
    [self.administrationRoom addPerson:self.director];
    [self.administrationRoom addPerson:self.accountant];
    [self.carwashRoom addPerson:self.washer];
}

- (void)runCarwash:(TSYCar *)car {
    [self.carwashRoom addCar:car];
    
    NSUInteger price = 60;
    
    [self.washer setPrice:price];
    
    [self.washer wash:car];
    [self.carwashRoom removeCar:car];
    
    [car giveMoney:price toObject:self.washer];
    
    [self.washer giveMoney:price toObject:self.accountant];
    [self.accountant calculateMoney:price];
    
    [self.accountant giveMoney:price toObject:self.director];
    [self.director earnProfit];
}

@end
