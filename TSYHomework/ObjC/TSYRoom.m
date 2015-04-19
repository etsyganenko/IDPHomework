//
//  TSYRoom.m
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYRoom.h"

@interface TSYRoom ()
@property (nonatomic, retain) NSMutableArray    *mutablePeople;
@property (nonatomic, assign) NSUInteger        peopleCapacity;
@property (nonatomic, assign) NSUInteger        peopleCount;

@end

@implementation TSYRoom

@dynamic people;

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity {
    TSYRoom *room = [[[self alloc] init] autorelease];
    
    room.peopleCapacity = peopleCapacity;
    
    return room;
}

- (void)dealloc {
    self.mutablePeople = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutablePeople = [NSMutableArray array];
    }
    
    return self;
}

- (NSArray *)people {
    return [[self.mutablePeople copy] autorelease];
}

- (void)addPerson:(TSYCreature *)person {
    if (![self.mutablePeople containsObject:person] && self.peopleCount < self.peopleCapacity) {
        [self.mutablePeople addObject:person];
    }
}

- (void)removePerson:(TSYCreature *)person {
    [self.mutablePeople removeObject:person];
}

@end
