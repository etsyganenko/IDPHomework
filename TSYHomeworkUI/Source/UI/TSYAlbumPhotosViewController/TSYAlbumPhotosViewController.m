//
//  TSYAlbumPhotosViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumPhotosViewController.h"

#import "TSYAlbumPhotosView.m"
#import "TSYAlbumViewCell.h"
#import "TSYFBUserModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookAlbumPhotosContext.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@interface TSYAlbumPhotosViewController ()

@end

TSYViewControllerBaseViewProperty(TSYAlbumPhotosViewController, TSYAlbumPhotosView, mainView)

@implementation TSYAlbumPhotosViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    self.context = [TSYFacebookAlbumPhotosContext contextWithModel:self.model];
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {

}

@end
