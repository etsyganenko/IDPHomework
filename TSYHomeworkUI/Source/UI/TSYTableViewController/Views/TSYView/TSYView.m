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

- (void)showLoadingView {
    [self.loadingView show];
}

- (void)hideLoadingView {
    [self.loadingView hide];
}

@end
