//
//  NSArray+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 30.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSArray+TSYCategory.h"

@implementation NSArray (TSYCategory)

- (id)objectWithClass:(Class)cls {
    for (id object in self) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
