//
//  TSYFacebookAlbumCoverPhotoURLContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumCoverPhotoURLContext.h"

#import "TSYFBPhotoAlbumModel.h"

#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumCoverPhotoURLContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBPhotoAlbumModel *albumModel = self.model;
    NSString *albumCoverPhotoID = albumModel.albumCoverPhotoID;
    
    return [NSString stringWithFormat:kAlbumCoverPhotoURLGraphPath, albumCoverPhotoID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBPhotoAlbumModel *albumModel = self.model;
    NSURL *albumCoverPhotoURL = [NSURL URLWithString:result[kSourceKey]];
    
    albumModel.albumCoverPhotoURL = albumCoverPhotoURL;
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
