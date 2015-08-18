//
//  TSYContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYContext.h"

@interface TSYContext ()
@property (nonatomic, strong)   NSMutableArray  *contexts;

@end

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
        self.contexts = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)context {
    return [[self alloc] initWithModel:nil];;
}

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

- (void)addContext:(TSYContext *)context {
    if (context) {
        [self.contexts addObject:context];
        
        [context addObserver:self];
        
        [context execute];
    }
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
