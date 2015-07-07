//
//  TSYModel.m
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYModel.h"

@implementation TSYModel

#pragma mark -
#pragma mark Public Methods

- (void)save {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)load {
    if (TSYModelDidLoad == self.state || TSYModelWillLoad == self.state) {
        [self notify];
        
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self performLoading];
    });
}

- (void)performLoading {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelWillLoad:
            return @selector(modelWillLoad:);
            
        case TSYModelDidLoad:
            return @selector(modelDidLoad:);
            
        case TSYModelFailedLoading:
            return nil;
            
        case TSYModelUnloaded:
            return nil;
            
        case TSYModelDidChange:
            return @selector(modelChanged:withObject:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end
