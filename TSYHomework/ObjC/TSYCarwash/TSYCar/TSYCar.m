//
//  TSYCar.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCar.h"

@interface TSYCar ()
@property (nonatomic, copy, readwrite)   NSString    *model;

@end

@implementation TSYCar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carWithModel: (NSString *)model
                       money:(NSUInteger)money {
    TSYCar *car = [[[self alloc] init] autorelease];
    
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
