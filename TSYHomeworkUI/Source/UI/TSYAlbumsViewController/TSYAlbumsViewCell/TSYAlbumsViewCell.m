//
//  TSYAlbumsViewCell.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumsViewCell.h"

#import "TSYImageModel.h"
#import "TSYFBPhotoAlbum.h"

@implementation TSYAlbumsViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBPhotoAlbum *)photoAlbumModel {
    NSURL *albumCoverPhotoURL = photoAlbumModel.coverPhotoURL;
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:albumCoverPhotoURL];
    
    self.photoImageView.imageModel = imageModel;
    self.albumNameLabel.text = photoAlbumModel.albumName;
}

@end
