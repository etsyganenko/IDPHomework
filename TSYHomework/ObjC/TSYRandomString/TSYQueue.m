//
//  TSYQueue.m
//  TSYHomework
//
//  Created by Admin on 26.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYQueue.h"

#import "NSObject+TSYCategory.h"

@interface TSYQueue ()
@property (nonatomic, readwrite)    NSMutableArray  *queue;

@end

@implementation TSYQueue

#pragma mark -
#pragma mark Class Methods

+ (instancetype)queue {
    TSYQueue *queue = [self object];
    
    return queue;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)isEmpty {
    @synchronized (self) {
        return (0 == [self.queue count]);
    }
}

- (void)enqueue:(id)object {
    @synchronized (self) {
        [self.queue addObject:object];
    }
}

- (id)dequeue {
    @synchronized (self) {
        NSMutableArray *queue = self.queue;
        id object = [[[queue firstObject] retain] autorelease];
        
        if (object) {
            [queue removeObject:object];
        }
        
        return object;
    }
}

@end
