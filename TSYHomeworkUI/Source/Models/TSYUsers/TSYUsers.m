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

#pragma mark -
#pragma mark Public Methods

- (void)addUser:(TSYUser *)user {
    [self.mutableUsers addObject:user];
}

- (void)removeUser:(TSYUser *)user {
    [self.mutableUsers removeObject:user];
}

- (TSYUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (TSYUser *)userAtIndexedSubscript:(NSUInteger)index {
    return [self.mutableUsers objectAtIndexedSubscript:index];
}

- (NSUInteger)count {
    return [self.mutableUsers count];
}

#pragma mark -
#pragma mark Private Methods

@end
