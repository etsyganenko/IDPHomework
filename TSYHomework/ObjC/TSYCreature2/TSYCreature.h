//
//  TSYCreature.h
//  TSYHomework
//
//  Created by Admin on 12.04.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYCreature : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, readonly) NSArray     *children;

+ (instancetype)creature;
+ (instancetype)creatureWithName:(NSString *)name;

- (void)addChild:(TSYCreature *)child;
- (void)removeChild:(TSYCreature *)child;

- (void)performGenderSpecificOperation;

- (void)sayHi;

@end
