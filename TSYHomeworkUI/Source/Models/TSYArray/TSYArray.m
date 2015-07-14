//
//  TSYArray.m
//  TSYHomeworkUI
//
//  Created by Admin on 09.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYArray.h"

#import "TSYModel.h"
#import "TSYTableChange.h"

#import "NSIndexPath+TSYCategory.h"
#import "NSMutableArray+TSYCategory.h"

static NSString * const kModelsKey               = @"modelsKey";

@interface TSYArray ()
@property (nonatomic, strong)   NSMutableArray  *models;

@end

@implementation TSYArray

@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)array {
    return [TSYArray new];
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

- (NSUInteger)count {
    return [self.models count];
}

#pragma mark -
#pragma mark Public Methods

- (void)addModel:(id)model {
    [self.models addObject:model];
}

- (void)removeModel:(id)model {
    NSUInteger index = [self.models indexOfObject:model];
    
    [self removeModelAtIndex:index];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.models insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.models removeObjectAtIndex:index];
}

- (void)addModelsFromArray:(NSArray *)array {
    [self.models addObjectsFromArray:array];
}

- (void)removeModels:(NSArray *)models {
    [self.models removeObjectsInArray:models];
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
    [self.models moveObjectAtIndex:sourceIndex
                                 toIndex:destinationIndex];
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
