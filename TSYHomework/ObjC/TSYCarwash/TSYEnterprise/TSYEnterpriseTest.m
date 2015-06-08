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
#import "TSYCarGenerator.h"

#import "NSString+TSYRandomCarNumber.h"

static const NSUInteger TSYCarsCount            = 5;
static const NSUInteger TSYCarMoney             = 100;

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        TSYCarGenerator *carGenerator = [TSYCarGenerator carGeneratorForEnterprise:enterprise
                                                                         withMoney:TSYCarMoney
                                                                          capacity:TSYCarsCount];
        
        [carGenerator start];
        
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }
}
