//
//  TSYRoom.m
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYRoom.h"
#import "TSYEmployee.h"
#import "NSObject+TSYCategory.h"

@interface TSYRoom ()
@property (nonatomic, retain) NSMutableArray    *mutablePeople;
@property (nonatomic, assign) NSUInteger        peopleCapacity;

@end

@implementation TSYRoom

@dynamic people;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity {
    TSYRoom *room = [[[self alloc] initWithPeopleCapacity:peopleCapacity] autorelease];
    
    return room;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutablePeople = nil;
    
    [super dealloc];
}

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity {
    self = [super init];
    if (self) {
        self.peopleCapacity = peopleCapacity;
        self.mutablePeople = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)people {
    return [[self.mutablePeople copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addPerson:(TSYEmployee *)person {
    if (![self.mutablePeople containsObject:person] && self.people.count < self.peopleCapacity) {
        [self.mutablePeople addObject:person];
    }
}

- (void)removePerson:(TSYEmployee *)person {
    [self.mutablePeople removeObject:person];
}

@end
