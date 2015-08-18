//
//  TSYUserDetailViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKLoginKit.h>

#import "TSYUserDetailViewController.h"

#import "TSYFBUserModel.h"
#import "TSYUserDetailView.h"
#import "TSYMacros.h"
#import "TSYFacebookUserInfoContext.h"
#import "TSYFacebookUserFriendsContext.h"
#import "TSYFriendsViewController.h"
#import "TSYAlbumsViewController.h"
#import "TSYArrayModel.h"

TSYViewControllerBaseViewProperty(TSYUserDetailViewController, TSYUserDetailView, mainView)

@implementation TSYUserDetailViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookUserInfoContext contextWithModel:self.model];
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

//- (void)modelWillLoad:(TSYFacebookUserInfoContext *)context {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.mainView showLoadingView];
//    });
//}

@end
