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
#import "TSYFBUserAlbumModel.h"
#import "TSYArrayModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookAlbumIDContext.h"
#import "TSYFacebookAlbumsContext.h"
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
    
    self.context = [TSYFacebookAlbumsContext contextWithModel:self.model];
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
    
    TSYFBUserModel *userModel = self.model;
    TSYFBUserAlbumModel *albumModel = userModel.albums[indexPath.row];
    
    NSURL *albumCoverPhotoURL = albumModel.albumCoverPhotoURL;
    
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:albumCoverPhotoURL];
    
    [cell fillWithModel:imageModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {
    TSYAlbumsView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

@end
