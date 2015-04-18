//
//  TSYCarwashTest.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarwashTest.h"
#import "TSYWasher.h"

@implementation TSYCarwashTest

void TSYCarwashPerformTest() {
    @autoreleasepool {
        TSYCar *car = [TSYCar carWithModel:@"VW" money:60];
        TSYWasher *washer = [TSYWasher employeeWithName:@"Ivan" salary:5000];
        
        [washer setPrice:50];
        [washer wash:car];
    }
}

@end
