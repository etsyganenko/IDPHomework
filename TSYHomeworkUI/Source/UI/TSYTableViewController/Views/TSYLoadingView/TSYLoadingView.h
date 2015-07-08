//
//  TSYLoadingView.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TSYLoadingView
@property (nonatomic, assign, getter=isVisible)    BOOL        visible;

@required
- (void)show;
- (void)hide;

@end

@interface TSYLoadingView : UIView <TSYLoadingView>
@property (nonatomic, assign) IBOutlet UIActivityIndicatorView   *spinner;

+ (instancetype)loadingViewWithSuperview:(UIView *)superview;

@end
