//
//  TSYAlbumsViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumsViewController.h"

#import "TSYAlbumsView.h"
#import "TSYAlbumsViewCell.h"
#import "TSYFBUserModel.h"
#import "TSYArrayModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookAlbumIDContext.h"
#import "TSYFacebookAlbumCoverPhotoContext.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@interface TSYAlbumsViewController ()

@end

TSYViewControllerBaseViewProperty(TSYAlbumsViewController, TSYAlbumsView, mainView)

@implementation TSYAlbumsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookAlbumIDContext new];
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
    
    return model.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumsViewCell *cell = [tableView cellWithClass:[TSYAlbumsViewCell class]];
    
    TSYFBUserModel *model = self.model;
    NSURL *coverPhotoURL = model.coverPhotoURLs[indexPath.row];
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:coverPhotoURL];
    
    [cell fillWithModel:imageModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {
    NSUInteger albumsCount = model.albumIDs.count;
    
    for (NSUInteger index = 0; index < albumsCount; index++) {
        self.context = [TSYFacebookAlbumCoverPhotoContext new];
    }
}

@end
