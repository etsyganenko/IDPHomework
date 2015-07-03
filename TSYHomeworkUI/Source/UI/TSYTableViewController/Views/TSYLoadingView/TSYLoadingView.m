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

static const NSTimeInterval TSYLoadingViewAnimationDuration        = 1;
static const CGFloat        TSYLoadingViewVisibleAlpha             = 0.5;
static const CGFloat        TSYLoadingViewInvisibleAlpha           = 1;

@interface TSYLoadingView ()
@property (nonatomic, assign, getter=isVisible)    BOOL        visible;

@end

@implementation TSYLoadingView

#pragma mark -
#pragma mark Class Methods

+ (TSYLoadingView *)loadingViewWithSuperview:(TSYView *)superview {
    TSYLoadingView *loadingView = [UINib objectWithClass:[TSYLoadingView class] owner:superview];

    [superview addSubview:loadingView];
    
    return loadingView;
}

#pragma mark -
#pragma mark Public Methods

- (void)show {
    [self.spinner startAnimating];
    
    [UIView animateWithDuration:TSYLoadingViewAnimationDuration
                     animations:^{
                         self.alpha = TSYLoadingViewVisibleAlpha;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.visible = YES;
                         }
                     }];
}

- (void)hide {
    [self.spinner stopAnimating];
    
    [UIView animateWithDuration:TSYLoadingViewAnimationDuration
                     animations:^{
                         self.alpha = TSYLoadingViewInvisibleAlpha;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.visible = NO;
                         }
                     }];
}

@end
