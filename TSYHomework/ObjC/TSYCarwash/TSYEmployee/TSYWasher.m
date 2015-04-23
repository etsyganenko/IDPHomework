//
//  TSYWasher.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYWasher.h"
#import "TSYCar.h"

@interface TSYWasher ()
@property (nonatomic, assign) BOOL  free;

@end

@implementation TSYWasher

#pragma mark -
#pragma mark Public Methods

- (void)wash:(TSYCar *)car {
    if (nil == car) {
        return;
    }
    
    self.free = NO;
    
    NSLog(@"%@ is washing %@", self.name, car.model);
    car.clean = true;
    
    self.free = YES;
}

@end
