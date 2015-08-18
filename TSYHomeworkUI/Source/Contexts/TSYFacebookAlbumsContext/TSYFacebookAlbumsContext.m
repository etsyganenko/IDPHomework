//
//  TSYFacebookAlbumsContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumsContext.h"

#import "TSYFBUserModel.h"
#import "TSYFBPhotoAlbumModel.h"

#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *userModel = self.model;
    
    return [NSString stringWithFormat:kAlbumsContextGraphPath, userModel.userID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    NSArray *photoAlbums = result[kDataKey];
    
    TSYFBUserModel *userModel = self.model;
    NSMutableArray *photoAlbumModels = userModel.photoAlbums;
    
    [photoAlbumModels removeAllObjects];
    
    for (NSDictionary *photoAlbum in photoAlbums) {
        TSYFBPhotoAlbumModel *photoAlbumModel = [TSYFBPhotoAlbumModel new];
        
        photoAlbumModel.albumName = photoAlbum[kNameKey];
        photoAlbumModel.albumID = photoAlbum[kIDKey];
        photoAlbumModel.albumCoverPhotoURL = [NSURL URLWithString:photoAlbum[kPictureKey][kDataKey][kURLKey]];
        
        [photoAlbumModels addObject:photoAlbumModel];
    }
}

@end
