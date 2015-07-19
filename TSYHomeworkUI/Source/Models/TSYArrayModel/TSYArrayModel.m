//
//  TSYArrayModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 09.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYArrayModel.h"

#import "TSYModel.h"
#import "TSYTableChange.h"

#import "NSIndexPath+TSYCategory.h"
#import "NSMutableArray+TSYCategory.h"

static NSString * const kModelsKey               = @"modelsKey";

@interface TSYArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *models;

@end

@implementation TSYArrayModel

@dynamic count;
@dynamic array;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)array {
    return [TSYArrayModel new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.models = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.models copy];
}

- (NSUInteger)count {
    return [self.models count];
}

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(id)model {
    NSUInteger index = self.count;
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                          changeValue:path];
    
    [self.models addObject:model];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)removeModel:(id)model {
    NSUInteger index = [self indexOfModel:model];
    
    [self removeModelAtIndex:index];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeAdd
                                                          changeValue:path];
    
    [self.models insertObject:model atIndex:index];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    NSIndexPath *path = [NSIndexPath indexPathForIndex:index];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeRemove
                                                          changeValue:path];
    
    [self.models removeObjectAtIndex:index];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

- (void)addModelsFromArray:(NSArray *)models {
    [self.models addObjectsFromArray:models];
}

- (void)removeModels:(NSArray *)models {
    NSUInteger count = models.count;
    
    for (NSUInteger index = 0; index < count; index++) {
        [self removeModel:models[index]];
    }
}

- (NSUInteger)indexOfModel:(id)model {
    return [self.models indexOfObject:model];
}

- (id)modelAtIndex:(NSUInteger)index {
    return [self.models objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.models objectAtIndexedSubscript:index];
}

- (void)moveModelAtIndex:(NSInteger)sourceIndex
                 toIndex:(NSInteger)destinationIndex
{
    TSYTableCellMovingPath *movingPath = [TSYTableCellMovingPath movingPathWithSourceIndex:sourceIndex
                                                                          destinationIndex:destinationIndex];
    
    TSYTableChange *tableChange = [TSYTableChange tableChangeWithType:TSYTableChangeTypeMove
                                                          changeValue:movingPath];
    
    [self.models moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
    
    [self setState:TSYModelDidChange withObject:tableChange];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.models forKey:kModelsKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.models = [aDecoder decodeObjectForKey:kModelsKey];
    }
    
    return self;
}

@end
