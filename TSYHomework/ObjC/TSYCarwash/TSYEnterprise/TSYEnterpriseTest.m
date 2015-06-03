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
#import "TSYDispatcher.h"

#import "NSString+TSYRandomString.h"
#import "NSString+TSYAlphabet.h"

static const NSUInteger TSYCarsCount        =   100;
static const NSUInteger TSYCarMoney         =   100;
static const NSUInteger TSYCarNameLength    =   5;

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        
        NSMutableArray *cars = [NSMutableArray array];
        
        NSString *alphabet = [NSString alphanumericAlphabet];
        
        for (NSUInteger index = 0; index < TSYCarsCount; index++) {
            NSString *model = [NSString randomStringWithLength:TSYCarNameLength alphabet:alphabet];
            
            [cars addObject:[TSYCar carWithModel:model money:TSYCarMoney]];
        }
        
        for (TSYCar *car in cars) {
//            [enterprise washCar:car];
            
            usleep(arc4random_uniform(1000));
            
            [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
        }
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }
}
