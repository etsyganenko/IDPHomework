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
#import "TSYFBUser.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYArrayModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookAlbumsContext.h"
#import "TSYAlbumPhotosViewController.h"
#import "TSYFacebookConstants.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@implementation TSYAlbumsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookAlbumsContext contextWithModel:self.model];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    TSYFBUser *userModel = self.model;
    
    self.navigationController.navigationBar.topItem.title = [NSString stringWithFormat:kPhotoAlbumsTitle, userModel.firstName];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumPhotosViewController *photosController = [TSYAlbumPhotosViewController new];
    
    TSYFBUser *userModel = self.model;
    TSYFBPhotoAlbum *photoAlbumModel = userModel.photoAlbums[indexPath.row];
    
    photosController.model = photoAlbumModel;
    
    [self.navigationController pushViewController:photosController animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBUser *userModel = self.model;
    
    return userModel.photoAlbums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumsViewCell *cell = [tableView cellWithClass:[TSYAlbumsViewCell class]];

    TSYFBUser *userModel = self.model;
    TSYFBPhotoAlbum *photoAlbumModel = userModel.photoAlbums[indexPath.row];
    
    [cell fillWithModel:photoAlbumModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFacebookAlbumsContext *)context {
    TSYAlbumsView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

@end
