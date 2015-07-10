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
#import "TSYArray.h"

#import "NSMutableArray+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"
#import "NSFileManager+TSYCategory.h"

static const NSUInteger TSYUsersSleepingTime    = 2;
static const NSUInteger TSYDefaultUsersCount    = 10;
static NSString * const kFileName               = @"users";

@interface TSYUsers ()
@property (nonatomic, readonly, getter=fileExists)   BOOL  fileExists;

@property (nonatomic, readonly)     NSString    *savingPath;
@property (nonatomic, strong)       TSYArray    *users;
@property (nonatomic, readonly)     NSString    *fileName;

- (void)fillWithUsers;

@end

@implementation TSYUsers

@dynamic count;
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
        self.users = [TSYArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.users.count;
}

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
    NSUInteger index = self.count;
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                          changeValue:path];
    
    [self.users addModel:user];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)removeUser:(TSYUser *)user {
    NSUInteger index = [self.users indexOfModel:user];
    
    [self removeUserAtIndex:index];
}

- (void)insertUser:(TSYUser *)user atIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                          changeValue:path];
    
    [self.users insertModel:user atIndex:index];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                          changeValue:path];
    
    [self.users removeModelAtIndex:index];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (TSYUser *)userAtIndex:(NSUInteger)index {
    return [self.users modelAtIndex:index];
}

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex
{
    TSYTableCellMovingPath *movingPath = [TSYTableCellMovingPath movingPathWithSourceIndex:sourceIndex
                                                                          destinationIndex:destinationIndex];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeMove
                                                          changeValue:movingPath];
    
    [self.users moveModelAtIndex:sourceIndex toIndex:destinationIndex];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
}

- (void)addUsersFromArray:(TSYArray *)array {
    [self.users addModelsFromArray:array];
    
    self.state = TSYModelDidChange;
    
//    NSUInteger count = array.count;
////
//    for (NSUInteger index = 0; index < count; index++) {
//        [self addUser:array[index]];
//    }
//
//
//    NSUInteger index = self.count;
//    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
//    
//    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
//                                                          changeValue:path];
//    
//    [self.users addModel:user];
//    
//    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.users toFile:self.savingPath];
}

- (void)performLoading {
//    if ([self fileExists]) {
//        TSYArray *savedUsers = [NSKeyedUnarchiver unarchiveObjectWithFile:self.savingPath];
//        
//        [self addUsersFromArray:savedUsers];
//    } else {
//        [self fillWithUsers];
//    }
    
    [self fillWithUsers];
    
    TSYSleep(TSYUsersSleepingTime)
    
    self.state = TSYModelDidLoad;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithUsers {
    for (NSUInteger index = 0; index < TSYDefaultUsersCount; index++) {
        [self.users addModel:[TSYUser user]];
    }
}

@end
