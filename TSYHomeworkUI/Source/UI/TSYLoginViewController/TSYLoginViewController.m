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
#import "TSYFBUserModel.h"

TSYViewControllerBaseViewProperty(TSYLoginViewController, TSYLoginView, mainView)

@interface TSYLoginViewController ()

//- (void)showUser:(TSYFBUserModel *)user ifLoggedInAnimated:(BOOL)animated;
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
        
        controller.userModel = [TSYFBUserModel new];
        
        [navigationController pushViewController:controller animated:animated];
    }
}

//- (void)showUser:(TSYFBUserModel *)user ifLoggedInAnimated:(BOOL)animated {
//    if ([FBSDKAccessToken currentAccessToken]) {
//        UINavigationController *navigationController = self.navigationController;
//        TSYFriendDetailViewController *controller = [TSYFriendDetailViewController new];
//        
//        controller.userModel = user;
//        
//        [navigationController pushViewController:controller animated:animated];
//    }
//}

- (void)fillWithModel:(TSYFBUserModel *)model {
    self.model.ID = model.ID;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {
    TSYLoginView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self fillWithModel:model];
        
        [mainView hideLoadingView];
    });
}

@end
