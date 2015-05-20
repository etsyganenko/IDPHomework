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
@property (nonatomic, readonly) NSUInteger  carwashRoomsCapacity;

+ (instancetype)carwashWithRoomsCapacity:(NSUInteger)roomsCapacity
                        carRoomsCapacity:(NSUInteger)carRoomsCapacity;

- (instancetype)initWithRoomsCapacity:(NSUInteger)roomsCapacity
                     carRoomsCapacity:(NSUInteger)carRoomsCapacity;

- (void)addCarwashRoom:(TSYCarwashRoom *)carwashRoom;
- (void)removeCarwashRoom:(TSYCarwashRoom *)carwashRoom;

@end
