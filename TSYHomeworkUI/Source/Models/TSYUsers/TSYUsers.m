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

#import "NSMutableArray+TSYCategory.h"
#import "NSIndexPath+TSYCategory.h"
#import "NSFileManager+TSYCategory.h"

static NSString * const kUsersKey               = @"usersKey";

static const NSUInteger TSYDefaultUsersCount    = 10;

@interface TSYUsers ()
@property (nonatomic, strong)   NSMutableArray  *mutableUsers;
@property (nonatomic, strong)   NSString        *fileName;
@property (nonatomic, strong)   NSString        *savingPath;

- (void)fillWithUsers;

@end

@implementation TSYUsers

@dynamic users;
@dynamic fileName;
@dynamic savingPath;

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

- (NSArray *)users {
    return [self.mutableUsers copy];
}

- (NSString *)fileName {
    return @"users";
}

- (NSString *)savingPath {
    return [[NSFileManager documentDirectoryPath] stringByAppendingPathComponent:self.fileName];
}

#pragma mark -
#pragma mark Public Methods

- (void)addUser:(TSYUser *)user {
    NSUInteger index = [self count];
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                          changeValue:path];
    
    [self.mutableUsers addObject:user];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)removeUser:(TSYUser *)user {
    NSUInteger index = [self.mutableUsers indexOfObject:user];
    
    [self removeUserAtIndex:index];
}

- (void)removeUserAtIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                          changeValue:path];
    
    [self.mutableUsers removeObjectAtIndex:index];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (TSYUser *)userAtIndex:(NSUInteger)index {
    return [self.mutableUsers objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.mutableUsers objectAtIndexedSubscript:index];
}

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex
{
    TSYTableCellMovingPath *movingPath = [TSYTableCellMovingPath movingPathWithSourceIndex:sourceIndex
                                                                          destinationIndex:destinationIndex];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeMove
                                                          changeValue:movingPath];
    
    [self.mutableUsers moveObjectAtIndex:sourceIndex
                                 toIndex:destinationIndex];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (NSUInteger)count {
    return [self.mutableUsers count];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.mutableUsers toFile:self.savingPath];
}

- (void)performLoading {
    NSMutableArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:self.savingPath];
    if (users) {
        self.mutableUsers = users;
    } else {
        self.mutableUsers = [NSMutableArray array];

        [self fillWithUsers];
    }
    
//    sleep(2);
    self.state = TSYModelDidLoad;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillWithUsers {
    for (NSUInteger index = 0; index < TSYDefaultUsersCount; index++) {
        [self.mutableUsers addObject:[TSYUser user]];
    }
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.mutableUsers = [aDecoder decodeObjectForKey:kUsersKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.users forKey:kUsersKey];
}

@end
