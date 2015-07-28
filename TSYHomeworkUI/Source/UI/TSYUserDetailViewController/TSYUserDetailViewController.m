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
#import "TSYFacebookUserFriendsContext.h"
#import "TSYFriendsViewController.h"
#import "TSYArrayModel.h"

TSYViewControllerBaseViewProperty(TSYUserDetailViewController, TSYUserDetailView, mainView)

@implementation TSYUserDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onFriendsButton:(id)sender {
    TSYFriendsViewController *friendsController = [TSYFriendsViewController new];
    UINavigationController *navigationController = self.navigationController;
    TSYArrayModel *model = [TSYArrayModel new];
    TSYFacebookUserFriendsContext *context = [TSYFacebookUserFriendsContext new];
    
    friendsController.model = model;
    context.model = model;
    
    friendsController.context = context;
    
    [navigationController pushViewController:friendsController animated:YES];
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