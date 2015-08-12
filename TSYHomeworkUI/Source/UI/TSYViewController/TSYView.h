//
//  TSYView.h
//  TSYHomeworkUI
//
//  Created by Admin on 02.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSYLoadingViewProtocol.h"

@interface TSYView : UIView
@property (nonatomic, readonly, getter=isloadingViewVisible)    BOOL        loadingViewVisible;

@property (nonatomic, strong)   IBOutlet UIView<TSYLoadingViewProtocol>  *loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
