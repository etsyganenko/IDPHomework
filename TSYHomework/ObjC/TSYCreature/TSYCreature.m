//
//  TSYCreature.m
//  TSYHomework
//
//  Created by Admin on 17.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreature.h"

@interface TSYCreature ()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation TSYCreature

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)creatureWithName: (NSString *)name
                          gender: (TSYGender)gender
{
    TSYCreature *creature = [[[self alloc] init] autorelease];
    
    creature.name = name;
    creature.gender = gender;
    
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
    [self.mutableChildren removeObject:child];
    
}

- (void)fight {
    NSLog(@"%@, you're in the army now!", self.name);
}

- (TSYCreature *)giveBirth {
    TSYCreature *child = [[[TSYCreature alloc] init] autorelease];
    
    NSLog(@"New creature was born by %@", self.name);
    
    return child;
}

- (void)sayHi {
    NSLog(@"Hi, my name is %@", self.name);
    
    for (TSYCreature *child in self.children) {
        [child sayHi];
    }
}

@end
