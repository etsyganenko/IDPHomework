//
//  TSYCreature.h
//  TSYHomework
//
//  Created by Admin on 17.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TSYGender) {
    TSYGenderNone,
    TSYGenderMale,
    TSYGenderFemale
};

@interface TSYCreature : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) TSYGender gender;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) NSUInteger weight;
@property (nonatomic, readonly) NSArray *children;

+ (instancetype)creatureWithName:(NSString *)name
                          gender:(TSYGender)gender;

- (void)addChild:(TSYCreature *)child;
- (void)removeChild:(TSYCreature *)child;

- (void)fight;
- (TSYCreature *)giveBirth;

- (void)sayHi;

@end
