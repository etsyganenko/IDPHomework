//
//  TSYLoadingView.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSYLoadingView : UIView
@property (nonatomic, assign) IBOutlet UIActivityIndicatorView   *spinner;
@property (nonatomic, readonly, getter=isVisible)    BOOL        visible;

+ (TSYLoadingView *)loadingViewWithSuperview:(UIView *)superview;

- (void)show;
- (void)hide;

@end
