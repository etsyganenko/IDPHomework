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
@property (nonatomic, assign)   NSMutableArray      *mutableIndexPathes;

@end

@implementation TSYTableChange

@dynamic indexPathes;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type indexPathes:(NSMutableArray *)indexPathes {
    return [[TSYTableChange alloc] initWithType:type
                                    indexPathes:indexPathes];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                        indexPathes:(NSMutableArray *)indexPathes
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.mutableIndexPathes = indexPathes;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)indexPathes {
    return [self.mutableIndexPathes copy];
}

@end
