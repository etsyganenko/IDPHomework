//
//  TSYCreature2.h
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYCreature2 : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, readonly) NSArray     *children;

+ (instancetype)creature;
+ (instancetype)creatureWithName:(NSString *)name;

- (void)addChild:(TSYCreature2 *)child;
- (void)removeChild:(TSYCreature2 *)child;

- (void)performGenderSpecificOperation;

- (void)sayHi;

@end
