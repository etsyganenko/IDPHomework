//
//  TSYObservableObject.h
//  TSYHomework
//
//  Created by Admin on 27.05.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSYObservableObject : NSObject
@property (atomic, assign)      NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)notify;
- (void)notifyOfStateChange:(NSUInteger)state withObject:(id)object;
- (SEL)selectorForState:(NSUInteger)state;

- (void)setState:(NSUInteger)state withObject:(id)object;

@end
