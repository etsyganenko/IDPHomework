//
//  TSYTableCellMovingPath.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYTableCellMovingPath.h"

@interface TSYTableCellMovingPath ()
@property (nonatomic, assign)   NSIndexPath   *sourceIndexPath;
@property (nonatomic, assign)   NSIndexPath   *destinationIndexPath;

@end

@implementation TSYTableCellMovingPath

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableCellMovingPathWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                                  destinationIndexPath:(NSIndexPath *)destinationIndexPath
{
    return [[self alloc] initWithSourceIndexPath:sourceIndexPath
                            destinationIndexPath:destinationIndexPath];
}

#pragma mark -
#pragma mark Initializations and Deallocations

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
