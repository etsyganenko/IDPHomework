//
//  TSYPhotosViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYPhotosViewController.h"

#import "TSYPhotosView.h"
#import "TSYPhotosViewCell.h"
#import "TSYFBUserModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookUserPhotosContext.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@interface TSYPhotosViewController ()

@end

TSYViewControllerBaseViewProperty(TSYPhotosViewController, TSYPhotosView, mainView)

@implementation TSYPhotosViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookUserPhotosContext new];
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
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBUserModel *model = self.model;
    
    return model.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYPhotosViewCell *cell = [tableView cellWithClass:[TSYPhotosViewCell class]];
    TSYFBUserModel *model = self.model;
    TSYFBUserModel *cellModel = model.photos[indexPath.row];
    
    [cell fillWithModel:cellModel];
    
    return cell;
}

@end
