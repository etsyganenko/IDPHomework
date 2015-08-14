//
//  TSYContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYContext.h"

@implementation TSYContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(id)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    
}

- (void)cancel {
    
}

- (void)fillModelWithResult:(id)result {
    
}

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelDidLoad:
            return @selector(modelDidLoad:);
            
        case TSYModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end
