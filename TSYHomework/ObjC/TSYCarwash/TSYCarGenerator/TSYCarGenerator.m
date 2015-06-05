//
//  TSYCarGenerator.m
//  TSYHomework
//
//  Created by Admin on 05.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarGenerator.h"

#import "TSYEnterprise.h"
#import "TSYCar.h"
#import "TSYQueue.h"

#import "NSString+TSYRandomCarNumber.h"
#import "NSObject+TSYCategory.h"

@interface TSYCarGenerator ()
@property (nonatomic, retain)   TSYQueue    *cars;

@end

@implementation TSYCarGenerator

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carGeneratorForEnterprise:(TSYEnterprise *)enterprise
                                withMoney:(NSUInteger)money
                                 capacity:(NSUInteger)capacity {
    
    TSYCarGenerator *carGenerator = [self object];
    
    carGenerator.enterprise = enterprise;
    carGenerator.capacity = capacity;
    carGenerator.money = money;
    
    return carGenerator;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cars = [TSYQueue queue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)washCarsWithTimer:(NSTimer *)timer {
    [self generateCars];
    
    TSYEnterprise *enterprise = self.enterprise;
    TSYQueue *cars = self.cars;
    NSUInteger capacity = self.capacity;
    
    for (NSUInteger index = 0; index < capacity; index++) {
//        [enterprise washCar:[cars dequeue]];
        [enterprise performSelectorInBackground:@selector(washCar:) withObject:[cars dequeue]];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)generateCars {
    TSYQueue *cars = self.cars;
    NSUInteger capacity = self.capacity;
    NSUInteger money = self.money;

    for (NSUInteger index = 0; index < capacity; index++) {
        NSString *carNumber = [NSString randomCarNumber];
        
        [cars enqueue:[TSYCar carWithCarNumber:carNumber money:money]];
    }
}

@end
