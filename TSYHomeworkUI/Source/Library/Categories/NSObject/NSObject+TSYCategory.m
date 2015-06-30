//
//  NSObject+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 30.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSObject+TSYCategory.h"

@implementation NSObject (TSYCategory)

- (id)objectWithClass:(Class)cls {
    if (![self respondsToSelector:@selector(countByEnumeratingWithState:objects:count:)]) {
        return nil;
    }
         
    for (id object in self) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
