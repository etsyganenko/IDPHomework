//
//  TSYCarwash.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYBuilding.h"

@interface TSYCarwash : TSYBuilding
@property (nonatomic, readonly) NSArray     *carRooms;
@property (nonatomic, readonly) NSUInteger  carRoomsAmount;

+ (instancetype)carwashWithRoomsAmount: (NSUInteger)roomsAmount
                        carRoomsAmount: (NSUInteger)carRoomsAmount;

- (NSArray *)carRooms;

@end
