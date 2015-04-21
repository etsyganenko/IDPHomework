//
//  TSYCarwash.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYBuilding.h"

@class TSYCarwashRoom;

@interface TSYCarwash : TSYBuilding
@property (nonatomic, readonly) NSArray     *carwashRooms;
@property (nonatomic, readonly) NSUInteger  carwashRoomsAmount;

+ (instancetype)carwashWithRoomsAmount:(NSUInteger)roomsAmount
                        carRoomsAmount:(NSUInteger)carRoomsAmount;

- (void)addCarwashRoom:(TSYCarwashRoom *)carwashRoom;
- (void)removeCarwashRoom:(TSYCarwashRoom *)carwashRoom;

@end
