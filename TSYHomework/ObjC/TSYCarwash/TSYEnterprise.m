//
//  TSYEnterprise.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterprise.h"
#import "TSYWasher.h"
#import "TSYCarwash.h"
#import "TSYAdministration.h"
#import "TSYCarwashRoom.h"
#import "TSYEmployee.h"
#import "TSYAccountant.h"
#import "TSYDirector.h"

@implementation TSYEnterprise

void TSYCarwashEnterprise() {
    @autoreleasepool {
        TSYCarwash *carwash = [TSYCarwash buildingWithRoomsAmount:1];
//        TSYCarwashRoom *carwashRoom = [TSYRoom roomWithPeopleCapacity:1];
        TSYCarwashRoom *carwashRoom = [TSYCarwashRoom roomWithPeopleCapacity:1];
        TSYWasher *washer = [TSYWasher employeeWithName:@"Ivan" salary:5000];
        NSUInteger price = 60;
        [carwash addRoom:carwashRoom];
        [carwashRoom addPerson:washer];
        
        TSYAdministration *administration = [TSYAdministration buildingWithRoomsAmount:1];
        TSYRoom *room = [TSYRoom roomWithPeopleCapacity:2];
        TSYAccountant *accountant = [TSYAccountant employeeWithName:@"Anton" salary:7000];
        TSYDirector *director = [TSYDirector employeeWithName:@"Mihal Mihalych" salary:10000];
        [room addPerson:accountant];
        [room addPerson:director];
        
        TSYCar *car = [TSYCar carWithModel:@"VW" money:100];
        
        [washer setPrice:price];
        [washer wash:car];
        [washer takeMoneyFromCar:price car:car];
        [accountant takeMoneyFromEmployee:price employee:washer];
        [accountant calculateMoney:price];
        [director takeMoneyFromEmployee:price employee:accountant];
        [director earnProfit];        
    }
}

@end
