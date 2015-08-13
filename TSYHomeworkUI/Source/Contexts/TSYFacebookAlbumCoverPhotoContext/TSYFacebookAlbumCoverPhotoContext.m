//
//  TSYFacebookAlbumCoverPhotoContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumCoverPhotoContext.h"

#import "TSYFBUserModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumCoverPhotoContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumCoverPhotoGraphPath, model.ID];
}

@end
