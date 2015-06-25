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
#import "TSYTableCellMovingPath.h"

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

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (_state != state) {
        _state = state;
    }
    
    [self notifyOfStateChange:state withObject:object];
}

#pragma mark -
#pragma mark Public Methods

- (void)addUser:(TSYUser *)user {
    NSUInteger index = [self count];
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    NSArray *paths = [NSArray arrayWithObject:path];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                           indexPaths:paths
                                                           movingPath:nil];
    
    [self.mutableUsers addObject:user];
    
    [self setState:TSYUsersStateDidChange withObject:tableChange];
}

- (void)removeUser:(TSYUser *)user {
    NSUInteger index = [self.mutableUsers indexOfObject:user];
    
    [self removeUserAtIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    NSArray *paths = [NSArray arrayWithObject:path];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                           indexPaths:paths
                                                           movingPath:nil];
    
//    TSYTableChange *change = [TSYTableChange tableChangeWithType:type
//                                                           index:(NSUInteger)index];
    
    [self.mutableUsers removeObjectAtIndex:index];
    
    [self setState:TSYUsersStateDidChange withObject:tableChange];
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
    NSIndexPath *sourcePath = [NSIndexPath indexPathForRow:sourceIndex inSection:0];
    NSIndexPath *destinationPath = [NSIndexPath indexPathForRow:destinationIndex inSection:0];
    TSYTableCellMovingPath *movingPath = [TSYTableCellMovingPath tableCellMovingPathWithSourceIndexPath:sourcePath
                                                                                   destinationIndexPath:destinationPath];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeMove
                                                           indexPaths:nil
                                                           movingPath:movingPath];
    
    [self.mutableUsers moveObjectAtIndex:sourceIndex
                                 toIndex:destinationIndex];
    
    [self setState:TSYUsersStateDidChange withObject:tableChange];
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
            return @selector(modelDidChange:withObject:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end
