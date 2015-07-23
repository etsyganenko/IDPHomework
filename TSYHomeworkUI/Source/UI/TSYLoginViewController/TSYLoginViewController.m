//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYLoginViewController.h"
#import "TSYFriendDetailViewController.h"

#import "TSYLoginView.h"
#import "TSYMacros.h"
#import "TSYLoginContext.h"

TSYViewControllerBaseViewProperty(TSYLoginViewController, TSYLoginView, mainView)

@interface TSYLoginViewController ()

- (void)showUserProfileIfLoggedInAnimated:(BOOL)animated;

@end

@implementation TSYLoginViewController

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
    TSYLoginContext *loginContext = [TSYLoginContext new];
    
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
        TSYFriendDetailViewController *controller = [TSYFriendDetailViewController new];
        
        [navigationController pushViewController:controller animated:animated];
    }
}

@end
