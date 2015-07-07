//
//  TSYView.h
//  TSYHomeworkUI
//
//  Created by Admin on 02.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSYLoadingView;

@interface TSYView : UIView
@property (nonatomic, readonly, getter=isloadingViewVisible)    BOOL        loadingViewVisible;

@property (nonatomic, strong)   IBOutlet TSYLoadingView  *loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
