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
        
        NSUInteger carsCount = 10;
        NSUInteger carMoney = 100;
        
        NSMutableArray *cars = [NSMutableArray array];
        
        NSString *alphabet = [NSString alphanumericAlphabet];
        
        for (NSUInteger index = 0; index < carsCount; index++) {
            NSString *model = [NSString randomStringWithLength:5 alphabet:alphabet];
            
            [cars addObject:[TSYCar carWithModel:model money:carMoney]];
        }
        
        for (TSYCar *car in cars) {
//            [enterprise washCar:car];
            [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
        }
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }
}

@end
