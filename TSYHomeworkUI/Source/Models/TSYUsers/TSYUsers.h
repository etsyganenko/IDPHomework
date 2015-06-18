//
//  TSYUsers.h
//  TSYHomeworkUI
//
//  Created by Admin on 18.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TSYUser;

@interface TSYUsers : NSObject
@property (nonatomic, readonly)   NSArray  *users;

+ (instancetype)users;

- (void)addUser:(TSYUser *)user;
- (void)removeUser:(TSYUser *)user;

- (TSYUser *)userAtIndex:(NSUInteger)index;
- (NSUInteger)usersCount;

@end
