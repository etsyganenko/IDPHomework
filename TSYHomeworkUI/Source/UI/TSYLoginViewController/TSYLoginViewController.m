//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYLoginViewController.h"

#import "TSYUserDetailViewController.h"
#import "TSYLoginView.h"
#import "TSYMacros.h"
#import "TSYFacebookLoginContext.h"
#import "TSYFacebookUserInfoContext.h"
#import "TSYFBUserModel.h"

TSYViewControllerBaseViewProperty(TSYLoginViewController, TSYLoginView, mainView)

@interface TSYLoginViewController ()

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated;

@end

@implementation TSYLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.topItem.rightBarButtonItem = nil;
    
    if (nil == [FBSDKAccessToken currentAccessToken]) {
        self.mainView.showUserProfile.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    TSYFBUserModel *model = [TSYFBUserModel new];
    TSYFacebookLoginContext *context = [TSYFacebookLoginContext contextWithModel:model];
    
    self.model = model;
    self.context = context;
}

- (IBAction)onUserProfileButton:(id)sender {
    [self showUserProfileIfLoggedInAnimated:YES];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYModel *)model {
    [self showUserProfileIfLoggedInAnimated:NO];
}

#pragma mark -
#pragma mark Private Methods

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated {
    TSYFBUserModel *model = self.model;
    NSString *userID = model.ID;
    
    if ([FBSDKAccessToken currentAccessToken] && userID) {
        UINavigationController *navigationController = self.navigationController;
        TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
        
        controller.ID = userID;
        
        [navigationController pushViewController:controller animated:animated];
    }
}

@end
