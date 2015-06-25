//
//  TSYUsers.m
//  TSYHomeworkUI
//
//  Created by Admin on 18.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUsers.h"

@interface TSYUsers ()
@property (nonatomic, strong)   NSMutableArray  *mutableUsers;

@end

@implementation TSYUsers

@dynamic users;

@synthesize state   = _state;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)users {
    return [TSYUsers new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableUsers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)users {
    return [self.mutableUsers copy];
}

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
    }
    
    [self notifyOfStateChange:state];
}

#pragma mark -
#pragma mark Public Methods

- (void)addUser:(TSYUser *)user {
    [self.mutableUsers addObject:user];
    
    self.state = TSYUsersStateDidChange;
}

- (void)removeUser:(TSYUser *)user {
    [self.mutableUsers removeObject:user];
    
    self.state = TSYUsersStateDidChange;
}

- (void)insertUser:(TSYUser *)user atIndex:(NSUInteger)index {
    [self.mutableUsers insertObject:user atIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self.mutableUsers removeObjectAtIndex:index];
    
    self.state = TSYUsersStateDidChange;
}

- (TSYUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.mutableUsers objectAtIndexedSubscript:index];
}

- (void)moveUserAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex
{
    [users mov];
    
    [self.mutableUsers exchangeObjectAtIndex:destinationIndex
                           withObjectAtIndex:sourceIndex];
    
    self.state = TSYUsersStateDidChange;
}

- (NSUInteger)count {
    return [self.mutableUsers count];
}

#pragma mark -
#pragma mark Private Methods

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYUsersStateDidChange:
            return @selector(modelDidChange:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end
