//
//  TSYTableCellMovingPath.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableCellMovingPath.h"

#import "NSIndexPath+TSYCategory.h"

@interface TSYTableCellMovingPath ()
@property (nonatomic, assign)   NSIndexPath   *sourceIndexPath;
@property (nonatomic, assign)   NSIndexPath   *destinationIndexPath;

@end

@implementation TSYTableCellMovingPath

#pragma mark -
#pragma mark Class Methods

+ (instancetype)movingPathWithSourceIndex:(NSInteger)sourceIndex
                         destinationIndex:(NSInteger)destinationIndex
{
    return [[self alloc] initWithSourceIndex:sourceIndex
                            destinationIndex:destinationIndex];
}

+ (instancetype)movingPathWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                         destinationIndexPath:(NSIndexPath *)destinationIndexPath
{
    return [[self alloc] initWithSourceIndexPath:sourceIndexPath
                            destinationIndexPath:destinationIndexPath];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSourceIndex:(NSInteger)sourceIndex
                   destinationIndex:(NSInteger)destinationIndex
{
    self = [super init];
    if (self) {
        self.sourceIndexPath = [NSIndexPath indexPathForIndex:sourceIndex];
        self.destinationIndexPath = [NSIndexPath indexPathForIndex:destinationIndex];
    }
    
    return self;
}

- (instancetype)initWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                   destinationIndexPath:(NSIndexPath *)destinationIndexPath
{
    self = [super init];
    if (self) {
        self.sourceIndexPath = sourceIndexPath;
        self.destinationIndexPath = destinationIndexPath;
    }
    
    return self;
}

@end
