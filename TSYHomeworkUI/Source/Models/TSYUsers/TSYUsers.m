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
@property (nonatomic, readonly)     NSArray     *notificationNames;

- (void)fillWithUsers;

- (void)subscribeToApplicationNotifications:(NSArray *)notificationNames;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationNames;

@end

@implementation TSYUsers

@dynamic savingPath;
@dynamic fileExists;
@dynamic fileName;
@dynamic notificationNames;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeFromApplicationNotifications:self.notificationNames];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subscribeToApplicationNotifications:self.notificationNames];
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

- (NSArray *)notificationNames {
    return @[UIApplicationWillTerminateNotification, UIApplicationWillResignActiveNotification];
}

#pragma mark -
#pragma mark Public Methods

- (void)saveWithNotification:(id)notification {
    [self save];
}

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

- (void)subscribeToApplicationNotifications:(NSArray *)notificationNames {
    for (NSString *notificationName in notificationNames) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:notificationName
                                                   object:nil];
    }
}

- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationNames {
    for (NSString *notificationName in notificationNames) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notificationName
                                                      object:nil];
    }
}

- (void)fillWithUsers {
    NSMutableArray *users = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < TSYDefaultUsersCount; index++) {
        [users addObject:[TSYUser new]];
    }
    
    [self addModelsFromArray:users];
}

@end
