//
//  TSYFacebookAlbumPhotosContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/17/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumPhotosContext.h"

#import "ActiveRecordKit.h"
#import "TSYManagedObject.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYFBPhoto.h"
#import "TSYFacebookConstants.h"

#import "NSOrderedSet+TSYCategory.h"

@implementation TSYFacebookAlbumPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBPhotoAlbum *photoAlbumModel = self.model;
    
    return [NSString stringWithFormat:kAlbumPhotosContextGraphPath, photoAlbumModel.ID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBPhotoAlbum *photoAlbum = self.model;
    NSOrderedSet *photos = photoAlbum.photos;
    
    NSArray *loadedPhotos = result[kDataKey];
    
    photoAlbum.photos = [photoAlbum updatedObjects:photos
                                           ofClass:[TSYFBPhoto class]
                                       withObjects:loadedPhotos];
    
    [photoAlbum saveManagedObject];
}

@end
