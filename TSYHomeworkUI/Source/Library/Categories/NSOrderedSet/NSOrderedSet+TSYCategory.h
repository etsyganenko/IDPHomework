//
//  NSOrderedSet+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/20/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOrderedSet (TSYCategory)

+ (NSOrderedSet *)updatedOrderedSet:(NSOrderedSet *)currentSet
                     withOrderedSet:(NSOrderedSet *)newSet;

@end
