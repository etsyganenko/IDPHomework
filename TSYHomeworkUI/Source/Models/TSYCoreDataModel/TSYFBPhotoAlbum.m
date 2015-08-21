//
//  TSYFBPhotoAlbum.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBPhotoAlbum.h"

#import "TSYFBPhoto.h"
#import "TSYFBUser.h"
#import "TSYFacebookConstants.h"

#import "NSManagedObject+IDPExtensions.h"

@interface TSYFBPhotoAlbum ()
@property (nonatomic, strong)   NSString    *coverPhotoURLString;

@end

@implementation TSYFBPhotoAlbum

@dynamic albumName;
@dynamic coverPhotoURLString;
@dynamic photos;
@dynamic user;

#pragma mark -
#pragma mark Accessors

- (NSURL *)coverPhotoURL {
    return [NSURL URLWithString:self.coverPhotoURLString];
}

- (void)setCoverPhotoURL:(NSURL *)coverPhotoURL {
    self.coverPhotoURLString = [coverPhotoURL absoluteString];
}

#pragma mark -
#pragma mark Public Methods

- (void)addPhoto:(TSYFBPhoto *)photo {
    [self addPhotosObject:photo];
}

- (void)removePhoto:(TSYFBPhoto *)photo {
    [self removePhotosObject:photo];
}

- (void)fillWithDictionary:(NSDictionary *)photoAlbumDictionary {
    self.albumName = photoAlbumDictionary[kNameKey];
    self.coverPhotoURL = [NSURL URLWithString:photoAlbumDictionary[kPictureKey][kDataKey][kURLKey]];
}

@end
