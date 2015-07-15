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
#import "TSYUser.h"
#import "TSYMacros.h"

#import "NSMutableArray+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"
#import "NSFileManager+TSYCategory.h"

static const NSUInteger TSYUsersSleepingTime    = 1;
static const NSUInteger TSYDefaultUsersCount    = 10;
static NSString * const kFileName               = @"users";

@interface TSYUsers ()
@property (nonatomic, readonly, getter=fileExists)   BOOL  fileExists;

@property (nonatomic, readonly)     NSString    *savingPath;
@property (nonatomic, readonly)     NSString    *fileName;

- (void)fillWithUsers;

@end

@implementation TSYUsers

@dynamic savingPath;
@dynamic fileExists;
@dynamic fileName;

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
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)savingPath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

- (BOOL)fileExists {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.savingPath];
}

- (NSString *)fileName {
    return kFileName;
}

#pragma mark -
#pragma mark Public Methods

- (void)addUser:(TSYUser *)user {
    [self addModel:user];
}

- (void)removeUser:(TSYUser *)user {
    [self removeModelAtIndex:[self indexOfModel:user]];
}

- (void)insertUser:(TSYUser *)user atIndex:(NSUInteger)index {
    [self insertModel:user atIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    [self removeModelAtIndex:index];
}

- (void)addUsersFromArray:(NSArray *)array {
    [self addModelsFromArray:array];
}

- (void)removeUsers:(NSArray *)array {
    [self removeModels:array];
}

- (TSYUser *)userAtIndex:(NSUInteger)index {
    return [self modelAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.array objectAtIndexedSubscript:index];
}

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex
{
    [self moveModelAtIndex:sourceIndex toIndex:destinationIndex];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.savingPath];
}

- (void)performLoading {
    if ([self fileExists]) {
        NSArray *savedUsers = [NSKeyedUnarchiver unarchiveObjectWithFile:self.savingPath];

        [self addUsersFromArray:savedUsers];
    } else {
        [self fillWithUsers];
    }
    
    TSYSleep(TSYUsersSleepingTime)
    
    self.state = TSYModelDidLoad;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithUsers {
    for (NSUInteger index = 0; index < TSYDefaultUsersCount; index++) {
        [self addUser:[TSYUser user]];
    }
}

@end
