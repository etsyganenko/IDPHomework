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
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                          target:carGenerator
                                                        selector:@selector(washCarsWithTimer:)
                                                        userInfo:nil
                                                         repeats:YES];
        
//        dispatch_queue_t queue = dispatch_queue_create("TSYQueue", DISPATCH_QUEUE_CONCURRENT);
//        
//        dispatch_async(queue, ^{
//            dispatch_apply(TSYCarsCount, queue, ^(size_t count){
//                [enterprise washCar:cars[count]];
//            });
//        });
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
        
        [timer invalidate];
        
//        dispatch_release(queue);
    }
}
