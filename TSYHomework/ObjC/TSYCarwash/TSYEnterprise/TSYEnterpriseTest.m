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

#import "NSString+TSYRandomCarNumber.h"

static const NSUInteger TSYCarsCount            = 100;
static const NSUInteger TSYCarMoney             = 100;

void TSYEnterprisePerformTest() {
    @autoreleasepool {
        TSYEnterprise *enterprise = [TSYEnterprise enterprise];
        
        NSMutableArray *cars = [NSMutableArray array];
        
        for (NSUInteger index = 0; index < TSYCarsCount; index++) {
            NSString *carNumber = [NSString randomCarNumber];
            
            [cars addObject:[TSYCar carWithCarNumber:carNumber money:TSYCarMoney]];
        }
        
//        for (TSYCar *car in cars) {
////            [enterprise washCar:car];
//            
//            usleep(arc4random_uniform(1000));
//            
//            [enterprise performSelectorInBackground:@selector(washCar:) withObject:car];
//        }

        dispatch_queue_t queue = dispatch_queue_create("TSYQueue", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_async(queue, ^{
            dispatch_apply(TSYCarsCount, queue, ^(size_t count){
                [enterprise washCar:cars[count]];
            });
        });
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
        
        dispatch_release(queue);
    }
}
