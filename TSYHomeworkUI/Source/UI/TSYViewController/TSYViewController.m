//
//  TSYViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYViewController.h"

#import "TSYContext.h"
#import "TSYModel.h"

@implementation TSYViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(TSYModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
    }
}

- (void)setContext:(TSYContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        
        if (context) {
            _context.model = self.model;
            
            [_context execute];
        }
    }
}

@end
