//
//  TSYTableChange.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableChange.h"

@interface TSYTableChange ()
@property (nonatomic, assign)   TSYTableChangeType  changeType;
@property (nonatomic, assign)   NSMutableArray      *mutableIndexes;

@end

@implementation TSYTableChange

@dynamic indexes;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type indexes:(NSMutableArray *)indexes {
    return [[TSYTableChange alloc] initWithType:type
                                        indexes:indexes];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                     indexes:(NSMutableArray *)indexes
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.mutableIndexes = indexes;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)indexes {
    return [self.mutableIndexes copy];
}

@end
