//
//  TSYAlbumPhotosViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumPhotosViewController.h"

#import "TSYAlbumPhotosView.h"
#import "TSYAlbumViewCell.h"
#import "TSYFBUserModel.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYImageModel.h"
#import "TSYArrayModel.h"
#import "TSYFBPhoto.h"
#import "TSYFacebookAlbumPhotosContext.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@implementation TSYAlbumPhotosViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookAlbumPhotosContext contextWithModel:self.model];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    TSYFBPhotoAlbum *photoAlbumModel = self.model;
    NSString *albumName = photoAlbumModel.albumName;
    
    self.navigationController.navigationBar.topItem.title = albumName;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBPhotoAlbum *photoAlbumModel = self.model;
    
    return photoAlbumModel.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumViewCell *cell = [tableView cellWithClass:[TSYAlbumViewCell class]];
    
    TSYFBPhotoAlbum *photoAlbumModel = self.model;
    TSYFBPhoto *photoModel = photoAlbumModel.photos[indexPath.row];
    
    [cell fillWithModel:photoModel];

    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFacebookAlbumPhotosContext *)context {
    TSYAlbumPhotosView *mainView = self.mainView;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView hideLoadingView];
        
        [mainView.tableView reloadData];
    });
}

@end
