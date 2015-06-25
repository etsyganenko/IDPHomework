//
//  NSMutableArray+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSMutableArray+TSYCategory.h"

@implementation NSMutableArray (TSYCategory)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex
                  toIndex:(NSUInteger)destinationIndex
{
    id object = [self objectAtIndex:sourceIndex];
    
    [self removeObjectAtIndex:sourceIndex];
    [self insertObject:object atIndex:destinationIndex];
}

@end
