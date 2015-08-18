//
//  TSYFacebookAlbumCoverPhotoIDContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumCoverPhotoIDContext.h"

#import "TSYFBUserModel.h"
#import "TSYFBPhotoAlbumModel.h"

#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumCoverPhotoIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBPhotoAlbumModel *albumModel = self.model;
    NSString *albumID = albumModel.albumID;
    
    return [NSString stringWithFormat:kAlbumCoverPhotoIDGraphPath, albumID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBPhotoAlbumModel *albumModel = self.model;
    
    NSString *albumCoverPhotoID = result[kCoverPhotoKey][kIDKey];
    
    albumModel.albumCoverPhotoID = albumCoverPhotoID;
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    if (error) {
        self.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    self.state = TSYModelDidLoad;
}

@end
