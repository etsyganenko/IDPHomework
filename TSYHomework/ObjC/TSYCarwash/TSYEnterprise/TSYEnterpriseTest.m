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

#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

@implementation TSYEnterpriseTest

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        
        NSUInteger carsAmount = 100;
        NSUInteger carMoney = 100;
        
        NSMutableArray *cars = [NSMutableArray array];
        NSMutableArray *carNames = [NSMutableArray array];
        
        for (NSUInteger index = 0; index < carsAmount; index++) {
            [carNames addObject:[NSString randomStringWithLength:5 alphabet:[NSString alphanumericAlphabet]]];
            [cars addObject:[TSYCar carWithModel:carNames[index] money:carMoney]];
        }
        
        for (NSUInteger index = 0; index < carsAmount; index++) {
            [enterprise washCar:cars[index]];
        }
    }
}

@end
