//
//  NSOrderedSet+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/20/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSOrderedSet+TSYCategory.h"

@implementation NSOrderedSet (TSYCategory)

+ (void)updateOrderedSet:(NSMutableOrderedSet *)currentSet withOrderedSet:(NSOrderedSet *)newSet {
    for (id object in newSet) {
        if (![currentSet containsObject:object]) {
            [currentSet addObject:object];
        }
    }
    
    for (id object in currentSet) {
        if (![newSet containsObject:object]) {
            [currentSet removeObject:object];
        }
    }
}

@end
