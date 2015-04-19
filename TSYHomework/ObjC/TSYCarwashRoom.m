//
//  TSYCarwashRoom.m
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarwashRoom.h"

@interface TSYCarwashRoom ()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation TSYCarwashRoom

@dynamic cars;

+ (instancetype)carwashRoomWithCarsCapacity:(NSUInteger)carsCapacity
                             peopleCapacity:(NSUInteger)peopleCapacity
{
    TSYCarwashRoom *carwashRoom = [TSYRoom roomWithPeopleCapacity:peopleCapacity];
    
    carwashRoom.carsCapacity = carsCapacity;
    
    return carwashRoom;
}

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

- (void)addCar:(TSYCar *)car {
    if (![self.mutableCars containsObject:car] && self.carsCount < self.carsCapacity) {
        [self.mutableCars addObject:car];
    }
}

- (void)removeCar:(TSYCar *)car {
    [self.mutableCars removeObject:car];
}

@end
