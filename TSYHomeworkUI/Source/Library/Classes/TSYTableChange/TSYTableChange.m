//
//  TSYTableChange.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableChange.h"

@interface TSYTableChange ()
@property (nonatomic, assign)   TSYTableChangeType          changeType;
@property (nonatomic, assign)   NSIndexPath                 *indexPath;
@property (nonatomic, assign)   TSYTableCellMovingPath      *indexPaths;

@end

@implementation TSYTableChange

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                          indexPath:(NSIndexPath *)indexPath
{
    return [[self alloc] initWithType:type indexPath:indexPath];
}

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                         indexPaths:(TSYTableCellMovingPath *)indexPaths
{
    return [[self alloc] initWithType:type indexPaths:indexPaths];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                   indexPath:(NSIndexPath *)indexPath
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.indexPath = indexPath;
    }
    
    return self;
}

- (instancetype)initWithType:(TSYTableChangeType)type
                  indexPaths:(TSYTableCellMovingPath *)indexPaths
{
    self = [self initWithType:type indexPath:nil];
    
    self.indexPaths = indexPaths;
    
    return self;
}

@end
