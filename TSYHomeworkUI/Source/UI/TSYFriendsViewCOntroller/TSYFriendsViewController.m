//
//  TSYLoginViewController.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFriendsViewController.h"

#import "TSYMacros.h"
#import "TSYFriendsView.h"
#import "TSYFBUserModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookUserFriendsContext.h"
#import "TSYFriendsViewCell.h"
#import "TSYUserDetailViewController.h"

#import "UITableView+TSYCategory.h"

TSYViewControllerBaseViewProperty(TSYFriendsViewController, TSYFriendsView, mainView)

@implementation TSYFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookUserFriendsContext contextWithModel:self.model];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSYFBUserModel *model = self.model;
    TSYFBUserModel *selectedModel = model.friends[indexPath.row];
    
    UINavigationController *navigationController = self.navigationController;
    TSYUserDetailViewController *controller = [TSYUserDetailViewController new];
    controller.ID = selectedModel.ID;
    
    [navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBUserModel *model = self.model;

    return model.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYFriendsViewCell *cell = [tableView cellWithClass:[TSYFriendsViewCell class]];
    TSYFBUserModel *model = self.model;
    TSYFBUserModel *cellModel = model.friends[indexPath.row];
    
    [cell fillWithModel:cellModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelWillLoad:(TSYFBUserModel *)model {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView showLoadingView];
    });
}

- (void)modelDidLoad:(TSYFBUserModel *)model {
    TSYFriendsView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

@end
