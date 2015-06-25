//
//  NSMutableArray+TSYCategory.h
//  TSYHomeworkUI
//
//  Created by Admin on 25.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TSYCategory)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex
                  toIndex:(NSUInteger)destinationIndex;

@end
