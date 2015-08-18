//
//  TSYLoadingView.m
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYLoadingView.h"

#import "TSYView.h"
#import "UINib+TSYCategory.h"

static const NSTimeInterval TSYLoadingViewAnimationDuration        = 0;
static const CGFloat        TSYLoadingViewVisibleAlpha             = 1.0;
static const CGFloat        TSYLoadingViewInvisibleAlpha           = 0.0;

@interface TSYLoadingView ()

- (void)animateVisible:(BOOL)visible;

@end

@implementation TSYLoadingView

@synthesize visible = _visible;

#pragma mark -
#pragma mark Class Methods

+ (TSYLoadingView *)loadingViewWithSuperview:(TSYView *)superview {
    TSYLoadingView *loadingView = [UINib objectWithClass:[TSYLoadingView class] owner:superview];

    [superview addSubview:loadingView];
    
//    loadingView.bounds = superview.bounds;
    loadingView.frame = superview.bounds;
    
    return loadingView;
}

#pragma mark -
#pragma mark Private Methods

- (void)animateVisible:(BOOL)visible {
    [UIView animateWithDuration:TSYLoadingViewAnimationDuration
                     animations:^{
                         self.alpha = visible ? TSYLoadingViewVisibleAlpha : TSYLoadingViewInvisibleAlpha;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.visible = visible;
                         }
                     }];
}

#pragma mark -
#pragma mark TSYLoadingView

- (void)show {
    [self animateVisible:YES];
}

- (void)hide {
    [self animateVisible:NO];
}

@end
