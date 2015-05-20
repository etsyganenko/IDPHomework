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
@property (nonatomic, assign) NSUInteger        carwashRoomsCapacity;

@end

@implementation TSYCarwash

@dynamic carwashRooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carwashWithRoomsCapacity:(NSUInteger)roomsCapacity
                        carRoomsCapacity:(NSUInteger)carRoomsCapacity
{
    TSYCarwash *carwash = [[[self alloc] initWithRoomsCapacity:roomsCapacity
                                              carRoomsCapacity:carRoomsCapacity] autorelease];
    
    return carwash;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCarwashRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithRoomsCapacity:(NSUInteger)roomsCapacity
                     carRoomsCapacity:(NSUInteger)carRoomsCapacity
{
    self = [super initWithRoomsCapacity:roomsCapacity];
    if (self) {
        self.carwashRoomsCapacity = carRoomsCapacity;
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
    if ([self.mutableCarwashRooms containsObject:carwashRoom] || [self.carwashRooms count] == self.carwashRoomsCapacity) {
        return;
    }
    
    [self.mutableCarwashRooms addObject:carwashRoom];
}

- (void)removeCarwashRoom:(TSYCarwashRoom *)carwashRoom {
    [self.mutableCarwashRooms removeObject:carwashRoom];
}

@end
