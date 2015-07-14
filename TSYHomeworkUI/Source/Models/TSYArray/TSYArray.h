//
//  TSYArray.h
//  TSYHomeworkUI
//
//  Created by Admin on 09.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSYModel.h"

@interface TSYArray : TSYModel <NSCoding>
@property (nonatomic, readonly)   NSArray       *array;
@property (nonatomic, readonly)   NSUInteger    count;

+ (instancetype)array;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)addModelsFromArray:(NSArray *)array;
- (void)removeModels:(NSArray *)models;

- (NSUInteger)indexOfModel:(id)model;
- (id)modelAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)moveModelAtIndex:(NSInteger)sourceIndex
                toIndex:(NSInteger)destinationIndex;

@end
