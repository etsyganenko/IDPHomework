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
#import "TSYFBPhotoAlbumModel.h"
#import "TSYImageModel.h"
#import "TSYArrayModel.h"
#import "TSYFBPhotoModel.h"
#import "TSYFacebookAlbumPhotosContext.h"
#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

TSYViewControllerBaseViewProperty(TSYAlbumPhotosViewController, TSYAlbumPhotosView, mainView)

@implementation TSYAlbumPhotosViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.context = [TSYFacebookAlbumPhotosContext contextWithModel:self.model];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    TSYFBPhotoAlbumModel *albumModel = self.model;
    NSString *albumName = albumModel.albumName;
    
    self.navigationController.navigationBar.topItem.title = albumName;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSYFBPhotoAlbumModel *albumModel = self.model;
    
    return albumModel.photoModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumViewCell *cell = [tableView cellWithClass:[TSYAlbumViewCell class]];
    
    TSYFBPhotoAlbumModel *albumModel = self.model;
    TSYFBPhotoModel *photoModel = albumModel.photoModels[indexPath.row];
    
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
