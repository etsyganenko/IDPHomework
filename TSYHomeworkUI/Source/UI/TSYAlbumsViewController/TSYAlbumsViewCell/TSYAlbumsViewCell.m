//
//  TSYAlbumsViewCell.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/12/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumsViewCell.h"

#import "TSYImageModel.h"
#import "TSYFBUserAlbumModel.h"

@implementation TSYAlbumsViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithImageModel:(TSYImageModel *)imageModel; {
    [self.photoImageView setImageModel:imageModel];
}

- (void)fillWithAlbumModel:(TSYFBUserAlbumModel *)albumModel {
    self.albumNameLabel.text = albumModel.albumName;
//    self.albumPhotosCountLabel.text =
}

@end
