//
//  TSYDirector.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYDirector.h"

#import "TSYAccountant.h"

@implementation TSYDirector

#pragma mark -
#pragma mark Public Methods

- (void)earnProfit {
    NSLog(@"%@ %@ is earning profit. Total profit = %lu", self.className, self.name, self.money);
}

- (void)processObject:(TSYAccountant *)accountant {
    [self takeMoney:accountant.money fromObject:accountant];
    
    [self earnProfit];
}

//- (void)performWorkWithObject:(TSYAccountant *)accountant {
//    @synchronized (self) {
//        [self processObject:accountant];
//        
//        accountant.state = TSYEmployeeStateFree;
//        
//        self.state = TSYEmployeeStateFree;
//    }
//}

- (void)performWorkWithObject:(TSYAccountant *)accountant {
    @synchronized (self) {
        [self processObject:accountant];

        accountant.state = TSYEmployeeStateFree;

        self.state = TSYEmployeeStateFree;
    }
}

#pragma mark -
#pragma mark TSYEmployeeObserver

- (void)employeeDidFinishWork:(TSYAccountant *)accountant {
    [self performWorkWithObject:accountant];
}

@end
