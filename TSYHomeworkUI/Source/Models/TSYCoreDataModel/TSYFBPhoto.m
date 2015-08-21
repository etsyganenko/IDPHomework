//
//  TSYFBPhoto.m
//  TSYHomeworkUI
//
//  Created by Yevgen on 8/19/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "TSYFBPhoto.h"

#import "TSYFBPhotoAlbum.h"
#import "TSYFacebookConstants.h"

@interface TSYFBPhoto ()
@property (nonatomic, strong)   NSString        *photoURLString;

@end

@implementation TSYFBPhoto

@dynamic photoURLString;
@dynamic photoAlbum;

#pragma mark -
#pragma mark Accessors

- (NSURL *)photoURL {
    return [NSURL URLWithString:self.photoURLString];
}

- (void)setPhotoURL:(NSURL *)photoURL {
    self.photoURLString = [photoURL absoluteString];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithDictionary:(NSDictionary *)photoDictionary {
    self.photoURL = [NSURL URLWithString:photoDictionary[kPictureKey]];
}

@end
