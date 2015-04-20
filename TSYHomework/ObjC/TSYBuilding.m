//
//  TSYBuilding.m
//  TSYHomework
//
//  Created by Admin on 18.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYBuilding.h"

@interface TSYBuilding ()
@property (nonatomic, retain) NSMutableArray    *mutableRooms;
@property (nonatomic, assign) NSUInteger        roomsAmount;

@end

@implementation TSYBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)buildingWithRoomsAmount: (NSUInteger)roomsAmount {
    TSYBuilding *building = [[[self alloc] init] autorelease];
    
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

@end
