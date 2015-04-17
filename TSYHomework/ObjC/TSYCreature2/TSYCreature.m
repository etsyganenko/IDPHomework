//
//  TSYCreature.m
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreature.h"
#import "NSObject+TSYCategory.h"

@interface TSYCreature ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation TSYCreature

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)creature {
    return [self object];
}

+ (instancetype)creatureWithName:(NSString *)name {
    TSYCreature *creature = [self object];
    creature.name = name;
    
    return creature;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableChildren = [NSMutableArray array];
    }
    
    return self;
}

- (void)performGenderSpecificOperation {
    
}

#pragma mark -
#pragma mark Accessors Methods

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addChild:(TSYCreature *)child {
    if (nil == child) {
        return;
    }
    
    NSMutableArray *array = self.mutableChildren;
    
    if (![array containsObject:child]) {
        [array addObject:child];
    }
}

- (void)removeChild:(TSYCreature *)child {
    NSMutableArray *array = self.mutableChildren;
    
    [array removeObject:child];
}

- (void)sayHi {
    NSLog(@"Hi! My name is %@\n", self.name);
    
    for (TSYCreature *creature in self.mutableChildren) {
        [creature sayHi];
    }
}

#pragma mark -
#pragma mark Private Methods

@end
