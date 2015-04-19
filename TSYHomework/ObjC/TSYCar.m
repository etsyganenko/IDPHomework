//
//  TSYCar.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCar.h"

@implementation TSYCar

+ (instancetype)carWithModel: (NSString *)model
                       money:(NSUInteger)money {
    TSYCar *car = [[[self alloc] init] autorelease];
    
    car.money = money;
    car.model = model;
    
    return car;
}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)payWithPrice: (NSUInteger)price {
    if (self.money < price) {
        NSLog(@"Ooops...");
        return false;
    } else {
        self.money -= price;
        return true;
    }
}

@end
