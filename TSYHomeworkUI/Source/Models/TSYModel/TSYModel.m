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
#pragma mark TSYObservableObject

- (void)save {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark TSYObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TSYModelStateDidChange:
            return @selector(modelChanged:withObject:);
            
        default:
            return [super selectorForState:state];;
    }
}

@end
