//
//  TSYObservableObject.m
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYObservableObject.h"

@interface TSYObservableObject ()
@property (nonatomic, retain)       NSMutableSet    *mutableObserversSet;

@end

@implementation TSYObservableObject

@dynamic observersSet;

@synthesize state   = _state;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObserversSet = nil;
    
    [super dealloc];
}

- (instancetype)initWithMutableObserversSet {
    self = [super init];
    if (self) {
        self.mutableObserversSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors Methods

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
//            [self notifyOfStateWithSelector:[self selectorForState:state]];
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
    return [[self.mutableObserversSet copy] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    [self.mutableObserversSet addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObserversSet removeObject:observer];
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
    
    for (id observer in self.observersSet) {
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
