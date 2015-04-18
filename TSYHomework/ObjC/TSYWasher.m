//
//  TSYWasher.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYWasher.h"

@implementation TSYWasher

- (void)wash:(TSYCar *)car {
    if (nil == car) {
        return;
    }
    
    if (car.money < self.price) {
        NSLog(@"Not enough money!");
        return;
    }
    
    car.money -= self.price;
    car.clean = true;
    
    NSLog(@"%@ is washing %@", self.name, car.model);
}

@end
