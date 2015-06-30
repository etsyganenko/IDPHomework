//
//  NSBundle+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 30.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSBundle+TSYCategory.h"

#import "NSObject+TSYCategory.h"

@implementation NSBundle (TSYCategory)

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self loadNibNamed:NSStringFromClass(cls)
                                    owner:owner
                                  options:options];
    
    return [objects objectWithClass:cls];
}

@end
