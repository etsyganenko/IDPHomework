//
//  TSYCarwash.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCarwash.h"

@interface TSYCarwash ()
@property (nonatomic, retain) NSMutableArray    *mutableCarRooms;
@property (nonatomic, assign) NSUInteger        carRoomsAmount;

@end

@implementation TSYCarwash

@dynamic carRooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carwashWithRoomsAmount: (NSUInteger)roomsAmount
                        carRoomsAmount: (NSUInteger)carRoomsAmount
{
//    TSYCarwash *carwash = [TSYBuilding buildingWithRoomsAmount:roomsAmount];
    TSYCarwash *carwash = [super buildingWithRoomsAmount:roomsAmount];
    
    carwash.carRoomsAmount = carRoomsAmount;
    
    return carwash;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCarRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithcarRooms {
    self = [super init];
    
    if (self) {
        self.mutableCarRooms = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)rooms {
    return [[self.mutableCarRooms copy] autorelease];
}

@end
