//
//  TSYFacebookConstants.h
//  TSYHomeworkUI
//
//  Created by Admin on 30.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kRequestHTTPMethodGet               = @"GET";

static NSString * const kReadPermissionEmail                = @"email";
static NSString * const kReadPermissionPublicProfile        = @"public_profile";
static NSString * const kReadPermissionUserFriends          = @"user_friends";
static NSString * const kReadPermissionUserPhotos           = @"user_photos";

static NSString * const kNameKey                            = @"name";
static NSString * const kIDKey                              = @"id";
static NSString * const kPictureKey                         = @"picture";
static NSString * const kDataKey                            = @"data";
static NSString * const kURLKey                             = @"url";
static NSString * const kPhotosKey                          = @"photos";

static NSString * const kUserFriendsContextGraphPath        = @"%@/friends?fields=name,picture.width(%lu).height(%lu),id";
static NSString * const kUserInfoContextGraphPath           = @"%@?fields=name,picture.width(%lu).height(%lu)";




//static NSString * const kAlbumCoverPhotoContextGraphPath  = @"342819972451257/photos?fields=images";
//static NSString * const kAlbumPhotosContextGraphPath      = @"342819972451257/photos?fields=images";
//static NSString * const kUserAlbumsContextGraphPath       = @"%@/albums?fields=photos";

static NSString * const kAlbumPhotosContextGraphPath         = @"%@/photos?fields=images";




static NSString * const kAlbumIDContextGraphPath            = @"%@/albums?fields=id"; // %@ == userID
static NSString * const kAlbumCoverPhotoIDGraphPath         = @"%@?fields=cover_photo"; // %@ == albumID
static NSString * const kAlbumCoverPhotoURLGraphPath        = @"%@?fields=source"; // %@ == albumCoverPhotoID


static NSString * const kAlbumImagesIDGraphPath             = @"%@/photos?fields=images"; // %@ == albumID


static NSString * const kPictureWidthKey                    = @"width";
static NSString * const kPictureHeightKey                   = @"height";

static const NSUInteger kUserInfoContextPictureWidth        = 400;
static const NSUInteger kUserInfoContextPictureHeight       = 400;

static const NSUInteger kUserFriendsContextPictureWidth     = 100;
static const NSUInteger kUserFriendsContextPictureHeight    = 100;

static NSString * const kLogoutButtonTitle                  = @"logout";
static NSString * const kAlertActionTitle                   = @"OK";
static NSString * const kAlertMessage                       = @"No internet connection";
