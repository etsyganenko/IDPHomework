//
//  TSYUserDetailViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYUserDetailViewController.h"

#import "TSYFBUserModel.h"
#import "TSYUserDetailView.h"
#import "TSYMacros.h"
#import "TSYFacebookUserInfoContext.h"

TSYViewControllerBaseViewProperty(TSYUserDetailViewController, TSYUserDetailView, mainView)

@implementation TSYUserDetailViewController

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(TSYFBUserModel *)userModel {
    if (_userModel != userModel) {
        [_userModel removeObserver:self];
        
        _userModel = userModel;
        
        [_userModel addObserver:self];
        
        TSYFacebookUserInfoContext *context = [TSYFacebookUserInfoContext facebookUserInfoContextWithModel:userModel];
        [context execute];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYFBUserModel *)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

- (void)modelDidLoad:(TSYFBUserModel *)model {
    TSYUserDetailView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView fillWithModel:model];
        
        [mainView hideLoadingView];
    });
}

@end
