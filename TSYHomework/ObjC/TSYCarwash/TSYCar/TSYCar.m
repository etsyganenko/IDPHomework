//
//  TSYCar.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCar.h"
#import "TSYEmployee.h"
#import "NSObject+TSYCategory.h"

@interface TSYCar ()
@property (nonatomic, copy, readwrite)   NSString    *carNumber;

@end

@implementation TSYCar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carWithCarNumber: (NSString *)carNumber
                       money:(NSUInteger)money {
    TSYCar *car = [self object];
    
    car.money = money;
    car.carNumber = carNumber;
    
    return car;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.carNumber = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark TSYMoneyProtocol

- (BOOL)takeMoney:(NSUInteger)money fromObject:(TSYEmployee *)object {
    if ([object giveMoneyIfEnough:money]) {
        [self takeMoney:money];
        return YES;
    }
    return NO;
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
    }
}

- (BOOL)giveMoneyIfEnough:(NSUInteger)money {
    @synchronized (self) {
        if (self.money < money) {
            NSLog(@"%@ %@ has not enough money!", self.className, self.carNumber);
            return NO;
        }
        
        self.money -= money;
        return YES;
    }
}

@end
