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
    
    NSArray *loadedPhotos = result[kDataKey];
    
    NSOrderedSet *currentPhotos = photoAlbum.photos;
    NSMutableOrderedSet *mutableLoadedPhotos = [NSMutableOrderedSet new];
    
    for (NSDictionary *photosDictionary in loadedPhotos) {
        TSYFBPhoto *photo = [TSYFBPhoto managedObject];
        
        photo.ID = photosDictionary[kIDKey];
        photo.photoURL = [NSURL URLWithString:photosDictionary[kPictureKey]];
        
        [mutableLoadedPhotos addObject:photo];
        
        [photo saveManagedObject];
    }
    
    photoAlbum.photos = [NSOrderedSet updatedOrderedSet:currentPhotos withOrderedSet:mutableLoadedPhotos];
}

@end
