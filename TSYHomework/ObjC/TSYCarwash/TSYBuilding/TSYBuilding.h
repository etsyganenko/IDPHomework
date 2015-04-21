//
//  TSYBuilding.h
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYBuilding : NSObject
@property (nonatomic, readonly) NSArray     *rooms;
@property (nonatomic, readonly) NSUInteger  roomsAmount;

+ (instancetype)buildingWithRoomsAmount: (NSUInteger)roomsAmount;

- (NSArray *)rooms;

@end
