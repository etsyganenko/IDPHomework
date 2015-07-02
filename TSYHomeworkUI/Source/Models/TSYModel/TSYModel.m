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
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelStateDidChange:
            return @selector(modelChanged:withObject:);
            
        case TSYModelStateDidLoad:
//            return @selector();
            
        default:
            return [super selectorForState:state];;
    }
}

@end
