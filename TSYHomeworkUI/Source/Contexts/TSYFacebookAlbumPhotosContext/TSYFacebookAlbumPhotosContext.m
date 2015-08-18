//
//  TSYFacebookAlbumPhotosContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosContext.h"

#import "TSYFBPhotoAlbumModel.h"
#import "TSYFBPhotoModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookConstants.h"

@interface TSYFacebookAlbumPhotosContext ()


@end

@implementation TSYFacebookAlbumPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBPhotoAlbumModel *photoAlbumModel = self.model;
    
    return [NSString stringWithFormat:kAlbumPhotosContextGraphPath, photoAlbumModel.albumID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBPhotoAlbumModel *photoAlbumModel = self.model;
    TSYArrayModel *photoModels = photoAlbumModel.photoModels;
    
    NSArray *photosArray = result[kDataKey];
    
    for (NSDictionary *photosDictionary in photosArray) {
        TSYFBPhotoModel *photoModel = [TSYFBPhotoModel new];
        
        photoModel.photoID = photosDictionary[kIDKey];
        photoModel.photoURL = [NSURL URLWithString:photosDictionary[kPictureKey]];
        
        [photoModels addModel: photoModel];
    }
}

@end
