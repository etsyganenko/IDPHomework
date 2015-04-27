//
//  TSYEnterpriseTest.m
//  TSYHomework
//
//  Created by Admin on 22.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterpriseTest.h"
#import "TSYEnterprise.h"
#import "TSYCar.h"

@implementation TSYEnterpriseTest

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        
        NSMutableArray *cars = [NSMutableArray array];
        NSUInteger carsAmount = 5;
        
        for (NSUInteger index = 0; index < carsAmount; index++) {
            TSYCar *car = [TSYCar carWithModel:@"VW" money:100];
            [cars addObject:car];
        }
        
        for (NSUInteger index = 0; index < carsAmount; index++) {
            [enterprise runCarwash:cars[index]];
        }
    }
}

@end
