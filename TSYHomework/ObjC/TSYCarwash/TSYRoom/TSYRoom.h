//
//  TSYRoom.h
//  TSYHomework
//
//  Created by Admin on 19.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYCreature.h"

@interface TSYRoom : NSObject
@property (nonatomic, readonly) NSArray     *people;
@property (nonatomic, readonly) NSUInteger  peopleCapacity;
@property (nonatomic, readonly) NSUInteger  peopleCount;

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity;

- (void)addPerson:(TSYCreature *)person;
- (void)removePerson:(TSYCreature *)person;

@end
