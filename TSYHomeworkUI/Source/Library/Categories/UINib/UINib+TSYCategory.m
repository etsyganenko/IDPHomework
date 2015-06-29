//
//  UINib+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 29.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "UINib+TSYCategory.h"

@implementation UINib (TSYCategory)

#pragma mark -
#pragma mark Class Methods

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    UINib *nib = [UINib nibWithClass:cls bundle:nil];
    
    return [nib objectWithClass:cls owner:owner options:options];
}

+ (UINib *)nibWithClass:(Class)cls {
    return [UINib nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (instancetype)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (instancetype)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
