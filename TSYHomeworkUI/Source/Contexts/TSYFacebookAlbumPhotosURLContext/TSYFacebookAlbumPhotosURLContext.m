//
//  TSYFacebookAlbumPhotosURLContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosURLContext.h"

#import "TSYFBPhotoModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumPhotosURLContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBPhotoModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumPhotoURLGraphPath, model.photoID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    
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
