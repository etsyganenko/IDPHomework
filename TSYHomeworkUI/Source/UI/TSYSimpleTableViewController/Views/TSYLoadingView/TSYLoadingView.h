//
//  TSYLoadingView.h
//  TSYHomeworkUI
//
//  Created by Admin on 01.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYLoadingViewProtocol.h"

@interface TSYLoadingView : UIView <TSYLoadingViewProtocol>
@property (nonatomic, assign) IBOutlet UIActivityIndicatorView   *spinner;

+ (instancetype)loadingViewWithSuperview:(UIView *)superview;

@end