//
//  TSYEnterprise.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYEnterprise.h"
#import "TSYWasher.h"

@implementation TSYEnterprise

void TSYCarwashBusinessFlow() {
    @autoreleasepool {
        TSYCar *car = [TSYCar carWithModel:@"VW" money:60];
        TSYWasher *washer = [TSYWasher employeeWithName:@"Ivan" salary:5000];
        
        [washer setPrice:60];
        [washer wash:car];
        
        
    }
}

@end
