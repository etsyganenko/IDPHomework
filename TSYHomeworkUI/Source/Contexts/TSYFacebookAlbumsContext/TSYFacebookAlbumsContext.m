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
    NSOrderedSet *photoAlbums = userModel.photoAlbums;
    
    NSArray *loadedPhotoAlbums = result[kDataKey];
    
    userModel.photoAlbums = [userModel updatedObjects:photoAlbums
                                              ofClass:[TSYFBPhotoAlbum class]
                                          withObjects:loadedPhotoAlbums];
    
    [userModel saveManagedObject];
}

@end
