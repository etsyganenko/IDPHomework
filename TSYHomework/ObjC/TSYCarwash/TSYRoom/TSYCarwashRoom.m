//
//  TSYCarwashRoom.m
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarwashRoom.h"
#import "TSYCar.h"

@interface TSYCarwashRoom ()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation TSYCarwashRoom

@dynamic cars;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carwashRoomWithCarsCapacity:(NSUInteger)carsCapacity
                             peopleCapacity:(NSUInteger)peopleCapacity
{
    TSYCarwashRoom *carwashRoom = [self roomWithPeopleCapacity:peopleCapacity];
    
    carwashRoom.carsCapacity = carsCapacity;
    
    return carwashRoom;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCars = [NSMutableArray array];
    }
    
    return  self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCar:(TSYCar *)car {
    if (![self.mutableCars containsObject:car] && self.cars.count < self.carsCapacity) {
        [self.mutableCars addObject:car];
    }
}

- (void)removeCar:(TSYCar *)car {
    [self.mutableCars removeObject:car];
}

@end
