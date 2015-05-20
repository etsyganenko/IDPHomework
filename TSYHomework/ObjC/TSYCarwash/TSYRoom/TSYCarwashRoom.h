//
//  TSYCarwashRoom.h
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYRoom.h"

@class TSYCar;

@interface TSYCarwashRoom : TSYRoom
@property (nonatomic, readonly) NSArray     *cars;
@property (nonatomic, assign)   NSUInteger  carsCapacity;

+ (instancetype)carwashRoomWithPeopleCapacity:(NSUInteger)peopleCapacity
                                 carsCapacity:(NSUInteger)carsCapacity;

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity
                          carsCapacity:(NSUInteger)carsCapacity;

- (void)addCar:(TSYCar *)car;
- (void)removeCar:(TSYCar *)car;

@end
