//
//  TSYAlbumPhotosViewController.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumPhotosViewController.h"

#import "TSYAlbumViewCell.h"
#import "TSYFBUserModel.h"
#import "TSYImageModel.h"

#import "TSYMacros.h"

#import "UITableView+TSYCategory.h"

@interface TSYAlbumPhotosViewController ()

@end

TSYViewControllerBaseViewProperty(TSYAlbumPhotosViewController, TSYAlbumViewCell, mainView)

@implementation TSYAlbumPhotosViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.context = [TSYFacebookAlbumIDContext new];
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
    NSDictionary *photoURLs = model.photoURLs;
    NSArray *albumPhotoURLs = [photoURLs objectsForKeys:@[self.albumID] notFoundMarker:nil];
    
    return albumPhotoURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSYAlbumViewCell *cell = [tableView cellWithClass:[TSYAlbumViewCell class]];
    
    TSYFBUserModel *model = self.model;
    NSDictionary *photoURLs = model.photoURLs;
    NSArray *albumPhotoURLs = [photoURLs objectsForKeys:@[self.albumID] notFoundMarker:nil];
    NSURL *photoURL = albumPhotoURLs[indexPath.row];
    
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:photoURL];
    
    [cell fillWithModel:imageModel];
    
    return cell;
}

#pragma mark -
#pragma mark TSYModelObserver

- (void)modelDidLoad:(TSYFBUserModel *)model {

}

@end
