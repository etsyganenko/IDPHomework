//
//  TSYCarwashRoom.h
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYRoom.h"
#import "TSYCar.h"

@interface TSYCarwashRoom : TSYRoom
@property (nonatomic, readonly) NSArray     *cars;
@property (nonatomic, assign)   NSUInteger  carsCapacity;
@property (nonatomic, assign)   NSUInteger  carsCount;

+ (instancetype)carwashRoomWithCarsCapacity:(NSUInteger)carsCapacity
                             peopleCapacity:(NSUInteger)peopleCapacity;

- (NSArray *)cars;
- (void)addCar:(TSYCar *)car;
- (void)removeCar:(TSYCar *)car;

@end
