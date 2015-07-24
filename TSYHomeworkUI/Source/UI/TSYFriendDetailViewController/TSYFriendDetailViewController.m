//
//  TSYFriendDetailViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendDetailViewController.h"

#import "TSYFBUserModel.h"
#import "TSYFriendDetailView.h"
#import "TSYMacros.h"
#import "TSYLoadingContext.h"

TSYViewControllerBaseViewProperty(TSYFriendDetailViewController, TSYFriendDetailView, mainView)

@implementation TSYFriendDetailViewController

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(TSYFBUserModel *)userModel {
    if (_userModel != userModel) {
        [_userModel removeObserver:self];
        
        _userModel = userModel;
        
        [_userModel addObserver:self];
        
        TSYLoadingContext *context = [TSYLoadingContext loadingContextWithModel:userModel];
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
    TSYFriendDetailView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView fillWithModel:model];
        
        [mainView hideLoadingView];
    });
}

@end
