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

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.savingPath];
}

- (void)performLoading {
    if ([self fileExists]) {
        NSArray *savedUsers = [NSKeyedUnarchiver unarchiveObjectWithFile:self.savingPath];

        [self addModelsFromArray:savedUsers];
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
        [self addModel:[TSYUser new]];
    }
}

@end
