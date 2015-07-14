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

//- (void)addUsers:(NSArray *)users;

- (void)addUsers:(TSYArray *)array;
- (void)removeUsers:(NSArray *)users;

- (TSYUser *)userAtIndex:(NSUInteger)index;

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex;

- (void)save;

@end
