//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendsViewController.h"

#import "TSYMacros.h"
#import "TSYTableView.h"
#import "TSYFBUser.h"
#import "TSYArrayModel.h"
#import "TSYFacebookUserFriendsContext.h"
#import "TSYFriendsViewCell.h"
#import "TSYUserDetailViewController.h"

#import "UITableView+TSYCategory.h"

@implementation TSYFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.context = [TSYFacebookUserFriendsContext contextWithModel:self.model];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSYFBUser *userModel = self.model;
    TSYFBUser *selectedUserModel = userModel.friends[indexPath.row];
    
    UINavigationController *navigationController = self.navigationController;
    TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
    controller.model = selectedUserModel;
    
    [navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBUser *model = self.model;

    return model.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYFriendsViewCell *cell = [tableView cellWithClass:[TSYFriendsViewCell class]];
    TSYFBUser *userModel = self.model;
    TSYFBUser *cellUserModel = userModel.friends[indexPath.row];
    
    [cell fillWithModel:cellUserModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

//- (void)modelWillLoad:(TSYFacebookUserFriendsContext *)context {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.mainView showLoadingView];
//    });
//}

//- (void)modelDidLoad:(TSYFacebookUserFriendsContext *)context {
//    TSYTableView *mainView = self.mainView;
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [mainView hideLoadingView];
//        
//        [mainView.tableView reloadData];
//    });
//}

@end
