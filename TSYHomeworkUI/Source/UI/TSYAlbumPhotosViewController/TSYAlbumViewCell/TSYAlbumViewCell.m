//
//  TSYAlbumViewCell.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYAlbumViewCell.h"

#import "TSYImageModel.h"
#import "TSYImageView.h"
#import "TSYFBPhotoModel.h"

@implementation TSYAlbumViewCell

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(TSYFBPhotoModel *)model {
    NSURL *photoURL = model.photoURL;
    TSYImageModel *imageModel = [TSYImageModel imageModelWithURL:photoURL];
    
    self.photoImageView.imageModel = imageModel;
}

@end