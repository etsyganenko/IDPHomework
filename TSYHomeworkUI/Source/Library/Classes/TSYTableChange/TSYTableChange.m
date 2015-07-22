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
@property (nonatomic, assign)   id                  changeValue;

@end

@implementation TSYTableChange

#pragma mark -
#pragma mark Class Methods

+ (instancetype)tableChangeWithType:(TSYTableChangeType)type
                        changeValue:(id)changeValue
{
    return [[self alloc] initWithType:type changeValue:changeValue];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithType:(TSYTableChangeType)type
                 changeValue:(id)changeValue
{
    self = [super init];
    if (self) {
        self.changeType = type;
        self.changeValue = changeValue;
    }
    
    return self;
}

@end
