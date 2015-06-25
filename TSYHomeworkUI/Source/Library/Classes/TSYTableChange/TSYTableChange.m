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
@property (nonatomic, assign)   NSArray                     *indexPaths;
@property (nonatomic, assign)   TSYTableCellMovingPath    *movingPath;

@end

@implementation TSYTableChange

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                         indexPaths:(NSArray *)indexPaths
                         movingPath:(TSYTableCellMovingPath *)movingPath
{
    return [[self alloc] initWithType:type
                           indexPaths:indexPaths
                           movingPath:movingPath];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                  indexPaths:(NSArray *)indexPaths
                  movingPath:(TSYTableCellMovingPath *)movingPath
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.indexPaths = indexPaths;
        self.movingPath = movingPath;
    }
    
    return self;
}

@end
