//
//  TSYBuilding.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYBuilding.h"
#import "TSYRoom.h"
#import "NSObject+TSYCategory.h"

@interface TSYBuilding ()
@property (nonatomic, retain) NSMutableArray    *mutableRooms;
@property (nonatomic, assign) NSUInteger        roomsCapacity;

@end

@implementation TSYBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)buildingWithRoomsCapacity:(NSUInteger)roomsCapacity {
    TSYBuilding *building = [[[self alloc] initWithRoomsCapacity:roomsCapacity] autorelease];
    
    return building;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithRoomsCapacity:(NSUInteger)roomsCapacity {
    self = [super init];
    if (self) {
        self.roomsCapacity = roomsCapacity;
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
    if ([self.mutableRooms containsObject:room] || [self.mutableRooms count] == self.roomsCapacity) {
        return;
    }
    
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(TSYRoom *)room {
    [self.mutableRooms removeObject:room];    
}

@end
