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
#import "TSYArrayModel.h"

@class TSYUser;

@interface TSYUsers : TSYArrayModel

+ (instancetype)users;

- (void)addUser:(TSYUser *)user;
- (void)removeUser:(TSYUser *)user;

- (void)insertUser:(TSYUser *)user atIndex:(NSUInteger)index;
- (void)removeUserAtIndex:(NSUInteger)index;

- (void)addUsersFromArray:(NSArray *)array;
- (void)removeUsers:(NSArray *)array;

- (TSYUser *)userAtIndex:(NSUInteger)index;

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex;

- (void)save;

@end
