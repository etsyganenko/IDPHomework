//
//  NSIndexPath+TSYCategory.m
//  TSYHomeworkUI
//
//  Created by Admin on 30.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NSIndexPath+TSYCategory.h"

@implementation NSIndexPath (TSYCategory)

+ (instancetype)indexPathForIndex:(NSInteger)index {
    return [NSIndexPath indexPathForRow:index inSection:0];
}

@end
