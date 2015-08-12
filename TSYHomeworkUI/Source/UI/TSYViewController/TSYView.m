//
//  TSYView.m
//  TSYHomeworkUI
//
//  Created by Admin on 02.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYView.h"

#import "TSYLoadingView.h"

@implementation TSYView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Accessors

- (BOOL)isLoadingViewVisible {
    return [self.loadingView isVisible];
}

#pragma mark -
#pragma mark Public Methods

- (void)showLoadingView {
    [self bringSubviewToFront:self.loadingView];
    
    [self.loadingView show];
}

- (void)hideLoadingView {
    [self.loadingView hide];
}

@end
