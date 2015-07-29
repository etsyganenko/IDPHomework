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

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    [self showUserProfileIfLoggedInAnimated:NO];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    TSYFBUserModel *model = [TSYFBUserModel new];
    TSYFacebookLoginContext *context = [TSYFacebookLoginContext new];
    
    self.model = model;
    self.context = context;
}

- (IBAction)onUserProfileButton:(id)sender {
    [self showUserProfileIfLoggedInAnimated:YES];
}

#pragma mark -
#pragma mark Private Methods

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated {
    if ([FBSDKAccessToken currentAccessToken]) {
        UINavigationController *navigationController = self.navigationController;
        TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
        
        controller.model = self.model;
        controller.context = [TSYFacebookUserInfoContext new];
        
        [navigationController pushViewController:controller animated:animated];
    }
}

@end
