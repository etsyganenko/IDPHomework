//
//  TSYWasher.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYWasher.h"

#import "TSYCar.h"

@implementation TSYWasher

#pragma mark -
#pragma mark Public Methods

- (void)washCar:(TSYCar *)car {
    if (nil == car) {
        return;
    }
    
    self.free = NO;
    
    NSLog(@"%@ %@ is washing %@ %@", self.className, self.name, car.className, car.model);
    car.clean = true;
    
    self.free = YES;
}

- (void)performWorkWithObject:(TSYCar *)car {
    [self washCar:car];
    [self takeMoney:self.price fromObject:car];
}

@end
