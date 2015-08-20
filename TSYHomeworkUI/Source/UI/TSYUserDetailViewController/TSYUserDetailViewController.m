//
//  TSYUserDetailViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit.h>

#import "TSYUserDetailViewController.h"

#import "TSYFBUser.h"
#import "TSYUserDetailView.h"
#import "TSYMacros.h"
#import "TSYFacebookUserInfoContext.h"
#import "TSYFacebookUserFriendsContext.h"
#import "TSYFriendsViewController.h"
#import "TSYAlbumsViewController.h"
#import "TSYLoginViewController.h"
#import "TSYArrayModel.h"

TSYViewControllerBaseViewProperty(TSYUserDetailViewController, TSYUserDetailView, mainView)

@interface TSYUserDetailViewController ()

- (void)hideBackButtonIfNeeded;

@end

@implementation TSYUserDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookUserInfoContext contextWithModel:self.model];

    [self hideBackButtonIfNeeded];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onFriendsButton:(id)sender {
    TSYFriendsViewController *friendsController = [TSYFriendsViewController new];
    UINavigationController *navigationController = self.navigationController;
    
    friendsController.model = self.model;
    
    [navigationController pushViewController:friendsController animated:YES];
}

- (IBAction)onPhotosButton:(id)sender {
    TSYAlbumsViewController *albumsController = [TSYAlbumsViewController new];
    
    albumsController.model = self.model;

    [self.navigationController pushViewController:albumsController animated:YES];
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFacebookUserInfoContext *)context {
    TSYUserDetailView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView fillWithModel:self.model];
        
        [mainView hideLoadingView];
    });
}

- (void)modelWillLoad:(TSYFacebookUserInfoContext *)context {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)hideBackButtonIfNeeded {
    NSArray *viewControllers = self.navigationController.viewControllers;
    NSUInteger viewControllersCount = viewControllers.count;
    id previousController = viewControllers[viewControllersCount - 2];
    
    if ([previousController isMemberOfClass:[TSYLoginViewController class]]) {
        self.navigationItem.hidesBackButton = YES;
    }
}

@end
