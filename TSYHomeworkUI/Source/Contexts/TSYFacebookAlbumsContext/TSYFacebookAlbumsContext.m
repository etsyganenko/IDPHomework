//
//  TSYFacebookAlbumsContext.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/13/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFacebookAlbumsContext.h"

#import "ActiveRecordKit.h"
#import "TSYFBUser.h"
#import "TSYFBPhotoAlbum.h"
#import "TSYManagedObject.h"
#import "TSYFacebookConstants.h"

#import "NSOrderedSet+TSYCategory.h"

@implementation TSYFacebookAlbumsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUser *userModel = self.model;
    
    return [NSString stringWithFormat:kAlbumsContextGraphPath, userModel.ID];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUser *userModel = self.model;
    
    NSOrderedSet *currentPhotoAlbums = userModel.photoAlbums;
    
    NSArray *loadedPhotoAlbums = result[kDataKey];
    NSMutableOrderedSet *mutableLoadedPhotoAlbums = [NSMutableOrderedSet new];
    
    for (NSDictionary *photoAlbum in loadedPhotoAlbums) {
        TSYFBPhotoAlbum *photoAlbumModel = [TSYFBPhotoAlbum managedObject];
        
        photoAlbumModel.albumName = photoAlbum[kNameKey];
        photoAlbumModel.ID = photoAlbum[kIDKey];
        photoAlbumModel.coverPhotoURL = [NSURL URLWithString:photoAlbum[kPictureKey][kDataKey][kURLKey]];
        
        [mutableLoadedPhotoAlbums addObject:photoAlbumModel];
        
        [photoAlbumModel saveManagedObject];
    }
    
    userModel.photoAlbums = [NSOrderedSet updatedOrderedSet:currentPhotoAlbums withOrderedSet:mutableLoadedPhotoAlbums];
}

@end
