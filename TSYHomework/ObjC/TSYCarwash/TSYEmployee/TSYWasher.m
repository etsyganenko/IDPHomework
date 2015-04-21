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
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)wash:(TSYCar *)car {
    if (nil == car) {
        return;
    }
    
    car.clean = true;
    
    NSLog(@"%@ is washing %@", self.name, car.model);
}

@end
