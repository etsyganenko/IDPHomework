//
//  TSYRoom.h
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSYEmployee;

@interface TSYRoom : NSObject
@property (nonatomic, readonly) NSArray     *people;
@property (nonatomic, readonly) NSUInteger  peopleCapacity;

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity;

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity;

- (void)addPerson:(TSYEmployee *)person;
- (void)removePerson:(TSYEmployee *)person;

@end
