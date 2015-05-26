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
#pragma mark Accessors Methods

- (void)setState:(TSYEmployeeState)state {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
            [self notifyOfStateWithSelector:[self selectorForState:state]];
        }
    }
}

- (TSYEmployeeState)state {
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

- (SEL)selectorForState:(TSYEmployeeState)state {
    switch (state) {
        case TSYEmployeeStateFree:
            return @selector(employeeDidBecomeFree:);
            
        case TSYEmployeeStateDidFinishWork:
            return @selector(employeeDidFinishWork:);
            
        default:
            return NULL;
    }
}

@end
