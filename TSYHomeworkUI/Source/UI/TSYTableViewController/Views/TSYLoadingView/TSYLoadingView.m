//
//  TSYLoadingView.m
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYLoadingView.h"

static const NSUInteger TSYLoadingViewAnimationDuration     = 1;
static const CGFloat TSYLoadingViewVisibleAlpha             = 0.5;
static const CGFloat TSYLoadingViewInvisibleAlpha           = 1;

@interface TSYLoadingView ()
@property (nonatomic, assign, getter=isVisible)    BOOL        visible;

@end

@implementation TSYLoadingView

#pragma mark -
#pragma mark Public Methods

- (void)show {
    [UIView animateWithDuration:TSYLoadingViewAnimationDuration
                     animations:^{
                         self.alpha = TSYLoadingViewVisibleAlpha;
                         [self.spinner startAnimating];
    }];
    
    self.visible = YES;
}

- (void)hide {
    [UIView animateWithDuration:TSYLoadingViewAnimationDuration
                     animations:^{
                         self.alpha = TSYLoadingViewInvisibleAlpha;
                         [self.spinner stopAnimating];
                     }];
    
    self.visible = NO;
}

@end
