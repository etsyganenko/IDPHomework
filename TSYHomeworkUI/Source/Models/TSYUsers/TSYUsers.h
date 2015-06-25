//
//  TSYUsers.h
//  TSYHomeworkUI
//
//  Created by Admin on 18.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TSYObservableObject.h"
#import "TSYTableViewController.h"

@class TSYUser;

typedef NS_ENUM(NSUInteger, TSYUsersState) {
    TSYUsersStateDidChange
};

@interface TSYUsers : TSYObservableObject
@property (nonatomic, readonly)   NSArray  *users;

+ (instancetype)users;

- (void)addUser:(TSYUser *)user;
- (void)removeUser:(TSYUser *)user;
- (void)removeUserAtIndex:(NSUInteger)index;

- (TSYUser *)userAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)moveUserAtIndex:(NSUInteger)sourceIndex
                toIndex:(NSUInteger)destinationIndex;

- (NSUInteger)count;

@end
