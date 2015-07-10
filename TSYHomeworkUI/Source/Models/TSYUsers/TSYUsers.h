//
//  TSYUsers.h
//  TSYHomeworkUI
//
//  Created by Admin on 18.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TSYModel.h"

@class TSYUser;
@class TSYArray;

@interface TSYUsers : TSYModel
@property (nonatomic, readonly)   NSUInteger    count;

+ (instancetype)users;

- (void)addUser:(TSYUser *)user;
- (void)removeUser:(TSYUser *)user;

- (void)insertUser:(TSYUser *)user atIndex:(NSUInteger)index;
- (void)removeUserAtIndex:(NSUInteger)index;

- (TSYUser *)userAtIndex:(NSUInteger)index;

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)save;

@end
