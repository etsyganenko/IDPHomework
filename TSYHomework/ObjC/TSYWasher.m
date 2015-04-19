//
//  TSYWasher.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYWasher.h"
#import "TSYAccountant.h"

@implementation TSYWasher

- (void)wash:(TSYCar *)car {
    if (nil == car) {
        return;
    }
    
    if (![car payWithPrice:self.price]) {
        return;
    }
    
    [self takeMoneyForWashing:self.price];
    
    car.clean = true;
    
    NSLog(@"%@ is washing %@", self.name, car.model);
}

- (void)takeMoneyForWashing:(NSUInteger)money {
    self.money += money;
}

- (void)giveMoneyToAccountant:(NSUInteger)money {
    self.money -= money;
    
    [self.accountant takeMoneyFromWasher:money];
}

@end
