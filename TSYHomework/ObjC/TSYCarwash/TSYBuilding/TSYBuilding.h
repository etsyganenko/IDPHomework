//
//  TSYBuilding.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYRoom;

@interface TSYBuilding : NSObject
@property (nonatomic, readonly) NSArray     *rooms;
@property (nonatomic, readonly) NSUInteger  roomsCapacity;

+ (instancetype)buildingWithRoomsCapacity:(NSUInteger)roomsCapacity;

- (instancetype)initWithRoomsCapacity:(NSUInteger)roomsCapacity;

- (void)addRoom:(TSYRoom *)room;
- (void)removeRoom:(TSYRoom *)room;

@end
