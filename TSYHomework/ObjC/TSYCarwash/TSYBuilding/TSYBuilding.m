//
//  TSYBuilding.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYBuilding.h"
#import "TSYRoom.h"

@interface TSYBuilding ()
@property (nonatomic, retain) NSMutableArray    *mutableRooms;
@property (nonatomic, assign) NSUInteger        roomsAmount;

@end

@implementation TSYBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)buildingWithRoomsAmount: (NSUInteger)roomsAmount {
    TSYBuilding *building = [self object];
    
    building.roomsAmount = roomsAmount;
    
    return building;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithRooms {
    self = [super init];
    if (self) {
        self.mutableRooms = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addRoom:(TSYRoom *)room {
    if ([self.mutableRooms containsObject:room]) {
        return;
    }
    
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(TSYRoom *)room {
    [self.mutableRooms removeObject:room];    
}

@end
