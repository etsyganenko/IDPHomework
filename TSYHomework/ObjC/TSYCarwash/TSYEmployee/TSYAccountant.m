//
//  TSYAccountant.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAccountant.h"

#import "TSYWasher.h"

@implementation TSYAccountant

#pragma mark -
#pragma mark Public Methods

- (void)calculateMoney:(NSUInteger)money {    
    NSLog(@"%@ %@ is calculating money. Money = %lu", self.className, self.name, money);
}

- (void)processObject:(TSYWasher *)washer {
    [self takeMoney:washer.money fromObject:washer];
    [self calculateMoney:self.money];
}

- (void)employeeDidFinishWork:(TSYEmployee *)employee {
    [self processObject:employee];
}

@end
