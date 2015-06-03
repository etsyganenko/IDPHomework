//
//  TSYObservableObject.m
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYObservableObject.h"

@interface TSYObservableObject ()
@property (nonatomic, retain)   NSHashTable     *observersHashTable;

@end

@implementation TSYObservableObject

@dynamic observersSet;

@synthesize state   = _state;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;

            [self notifyOfStateChange:state];
        }
    }
}

- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

- (NSSet *)observersSet {
    @synchronized (self) {
        return [[self.observersHashTable copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (void)notifyOfStateChange:(NSUInteger)state {
    [self notifyOfStateWithSelector:[self selectorForState:state]];
}

#pragma mark -
#pragma mark Private Methods

- (void)notifyOfStateWithSelector:(SEL)selector {
    if (NULL == selector) {
        return;
    }
    
    for (id observer in self.observersHashTable	) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

// this method is for overriding in children
- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

@end
