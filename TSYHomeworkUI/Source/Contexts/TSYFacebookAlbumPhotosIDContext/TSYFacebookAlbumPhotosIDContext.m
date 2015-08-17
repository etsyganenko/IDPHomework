//
//  TSYFacebookAlbumPhotosIDContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosIDContext.h"

#import "TSYFBUserAlbumModel.h"
#import "TSYFBPhotoModel.h"
#import "TSYArrayModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookAlbumPhotosIDContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserAlbumModel *model = self.model;
    
    return [NSString stringWithFormat:kAlbumPhotosGraphPath, model.albumID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserAlbumModel *albumModel = self.model;
    
    NSArray *photos = result[kPhotosKey][kDataKey];
    NSUInteger photosCount = photos.count;
    
    for (NSUInteger index = 0; index < photosCount; index++) {
        NSDictionary *data = photos[index];
        TSYFBPhotoModel *photoModel = [TSYFBPhotoModel new];
        
        photoModel.photoID = data[kIDKey];
        
        [albumModel.photos addModel:photoModel];
    }
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
