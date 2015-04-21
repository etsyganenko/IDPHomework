//
//  TSYCarwash.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarwash.h"
#import "TSYCarwashRoom.h"

@interface TSYCarwash ()
@property (nonatomic, retain) NSMutableArray    *mutableCarwashRooms;
@property (nonatomic, assign) NSUInteger        carwashRoomsAmount;

@end

@implementation TSYCarwash

@dynamic carwashRooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carwashWithRoomsAmount: (NSUInteger)roomsAmount
                        carRoomsAmount: (NSUInteger)carRoomsAmount
{
    TSYCarwash *carwash = [self buildingWithRoomsAmount:roomsAmount];
    
    carwash.carwashRoomsAmount = carRoomsAmount;
    
    return carwash;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCarwashRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithcarRooms {
    self = [super init];
    
    if (self) {
        self.mutableCarwashRooms = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)carwashRooms {
    return [[self.mutableCarwashRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addCarwashRoom:(TSYCarwashRoom *)carwashRoom {
    if ([self.mutableCarwashRooms containsObject:carwashRoom]) {
        return;
    }
    
    [self.mutableCarwashRooms addObject:carwashRoom];
}

- (void)removeCarwashRoom:(TSYCarwashRoom *)carwashRoom {
    [self.mutableCarwashRooms removeObject:carwashRoom];
}

@end
