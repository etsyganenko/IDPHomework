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
#pragma mark Accessors

- (void)setModel:(TSYFBUserModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showUserProfileIfLoggedInAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onButtonLogin:(id)sender {
    TSYFBUserModel *model = [TSYFBUserModel new];
    self.model = model;
    
    TSYFacebookLoginContext *loginContext = [TSYFacebookLoginContext logingContextWithModel:model];
    
    [loginContext execute];
}

- (IBAction)onButtonShowUserProfile:(id)sender {
    [self showUserProfileIfLoggedInAnimated:YES];
}

#pragma mark -
#pragma mark Private Methods

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated {
    if ([FBSDKAccessToken currentAccessToken]) {
        UINavigationController *navigationController = self.navigationController;
        TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
        
        controller.userModel = self.model;
        
        [navigationController pushViewController:controller animated:animated];
    }
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {

}

@end
