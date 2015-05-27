//
//  TSYQueue.h
//  TSYHomework
//
//  Created by Admin on 26.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYQueue : NSObject

+ (instancetype)queue;

- (BOOL)isEmpty;

- (void)enqueue:(id)object;
- (id)dequeue;

@end
