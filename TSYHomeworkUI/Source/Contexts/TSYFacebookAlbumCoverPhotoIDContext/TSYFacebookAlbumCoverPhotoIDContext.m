//
//  TSYFacebookAlbumCoverPhotoIDContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/14/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumCoverPhotoIDContext.h"

#import "TSYFBUserModel.h"

#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumCoverPhotoIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    NSUInteger index = self.index;
    NSString *albumID = model.albumIDs[index];
    
    return [NSString stringWithFormat:kAlbumCoverPhotoGraphPath, albumID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    NSMutableArray *albumCoverPhotoIDs = model.albumCoverPhotoIDs;
    NSUInteger index = self.index;
    
    NSString *albumCoverPhotoID = result[@"cover_photo"][@"id"];
    
    NSLog(@"albumCoverPhotoID: %@", albumCoverPhotoID);
    
    albumCoverPhotoIDs[index] = albumCoverPhotoID;
    
    NSLog(@"albumCoverPhotoIDs: %@", model.albumCoverPhotoIDs);
}

- (void)processRequestResult:(id)result error:(NSError *)error {
    TSYFBUserModel *model = self.model;
    if (error) {
        model.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    //    model.state = TSYModelDidLoad;
    self.state = TSYModelDidLoad;
}

@end
