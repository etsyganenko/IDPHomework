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

@interface TSYUsers : TSYModel
@property (nonatomic, readonly)   NSArray  *users;

+ (instancetype)users;

- (void)addUser:(TSYUser *)user;
- (void)removeUser:(TSYUser *)user;
- (void)removeUserAtIndex:(NSUInteger)index;

- (TSYUser *)userAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)moveUserAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex;

- (NSUInteger)count;

- (void)save;

@end
