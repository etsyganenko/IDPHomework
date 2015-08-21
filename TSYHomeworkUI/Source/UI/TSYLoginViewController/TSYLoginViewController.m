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
#import "TSYFBUser.h"

TSYViewControllerBaseViewProperty(TSYLoginViewController, TSYLoginView, mainView)

@interface TSYLoginViewController ()

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated;

@end

@implementation TSYLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    
    if (nil == [FBSDKAccessToken currentAccessToken]) {
        self.mainView.showUserProfile.hidden = YES;
    }
    
    [self showUserProfileIfLoggedInAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    self.context = [TSYFacebookLoginContext contextWithModel:nil];
}

- (IBAction)onUserProfileButton:(id)sender {
    [self showUserProfileIfLoggedInAnimated:YES];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFacebookLoginContext *)context {
    self.model = context.model;
    
    [self showUserProfileIfLoggedInAnimated:NO];
}

#pragma mark -
#pragma mark Private Methods

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    NSString *loggedUserID = token.userID;
    TSYFBUser *loggedUserModel = [TSYFBUser objectWithID:loggedUserID];

    if (token && loggedUserModel) {
        TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
        
        controller.model = loggedUserModel;
        
        [self.navigationController pushViewController:controller animated:animated];
    }
}

@end
