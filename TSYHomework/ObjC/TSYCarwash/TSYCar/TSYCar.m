//
//  TSYCar.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCar.h"
#import "TSYEmployee.h"

@interface TSYCar ()
@property (nonatomic, copy, readwrite)   NSString    *model;

@end

@implementation TSYCar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carWithModel: (NSString *)model
                       money:(NSUInteger)money {
    TSYCar *car = [self object];
    
    car.money = money;
    car.model = model;
    
    return car;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)giveMoney:(NSUInteger)money toObject:(TSYEmployee *)object {
    if (self.money < money) {
        NSLog(@"Not enough money!");
        return;
    }
    
    self.money -= money;
    object.money += money;
}

@end
