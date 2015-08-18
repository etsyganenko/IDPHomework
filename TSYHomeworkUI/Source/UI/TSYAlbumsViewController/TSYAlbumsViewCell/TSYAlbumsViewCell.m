//
//  TSYAlbumsViewCell.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumsViewCell.h"

#import "TSYImageModel.h"
#import "TSYFBPhotoAlbumModel.h"

@implementation TSYAlbumsViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBPhotoAlbumModel *)albumModel {
    TSYImageModel *albumCoverPhoto = albumModel.albumCoverPhoto;
    
    self.photoImageView.imageModel = albumCoverPhoto;
    self.albumNameLabel.text = albumModel.albumName;
}

@end
