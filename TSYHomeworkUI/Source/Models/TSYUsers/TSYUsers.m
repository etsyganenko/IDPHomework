//
//  TSYUsers.m
//  TSYHomeworkUI
//
//  Created by Admin on 18.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUsers.h"

#import "TSYTableViewController.h"
#import "TSYTableChange.h"

#import "NSMutableArray+TSYCategory.h"

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
    
    NSUInteger index = [self count] - 1;
    NSMutableArray *indexes = [NSMutableArray arrayWithObject:@(index)];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                              indexes:indexes];
    
    self.state = TSYUsersStateDidChange;
}

- (void)removeUser:(TSYUser *)user {
    NSUInteger index = [self.mutableUsers indexOfObject:user];
    
    [self removeUserAtIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    NSMutableArray *indexes = [NSMutableArray arrayWithObject:@(index)];
    
    [self.mutableUsers removeObjectAtIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                              indexes:indexes];
    
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
    NSMutableArray *indexes = [NSMutableArray arrayWithObjects:@(sourceIndex), @(destinationIndex), nil];
    
    [self.mutableUsers moveObjectAtIndex:sourceIndex
                                 toIndex:destinationIndex];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                              indexes:indexes];
    
    self.state = TSYUsersStateDidChange;
    [self setState:<#(NSUInteger)#>]
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
