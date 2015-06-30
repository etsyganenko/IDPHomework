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
@property (nonatomic, assign)   id                  change;

@end

@implementation TSYTableChange

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                             change:(id)change
{
    return [[self alloc] initWithType:type change:change];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                      change:(id)change
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.change = change;
    }
    
    return self;
}

@end
