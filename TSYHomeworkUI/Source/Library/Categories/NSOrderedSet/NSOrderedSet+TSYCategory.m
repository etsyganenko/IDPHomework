//
//  NSOrderedSet+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/20/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSOrderedSet+TSYCategory.h"

@implementation NSOrderedSet (TSYCategory)

+ (NSOrderedSet *)updatedOrderedSet:(NSOrderedSet *)currentSet
                     withOrderedSet:(NSOrderedSet *)newSet
{
    NSMutableOrderedSet *mutableCurrentSet = [NSMutableOrderedSet orderedSetWithOrderedSet:currentSet];
    
    for (id object in newSet) {
        if (![currentSet containsObject:object]) {
            [mutableCurrentSet addObject:object];
        }
    }
    
    for (id object in currentSet) {
        if (![newSet containsObject:object]) {
            [mutableCurrentSet removeObject:object];
        }
    }
    
    return [mutableCurrentSet copy];
}

@end
