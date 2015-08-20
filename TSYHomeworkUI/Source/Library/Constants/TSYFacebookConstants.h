//
//  TSYFacebookConstants.h
//  TSYHomeworkUI
//
//  Created by Admin on 30.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

// почему в БД нельзя создавать поле ID
// как поменять в БД и не создавать заново модели
// создать абстрактного родителя с ID и поиском по ID
// absolute string
// [IDPCoreDataManager sharedManagerWithMomName:kMOMName] -> в appDelegate
// почему не работает [NSPredicate predicateWithFormat:@"%@ == %@", @"userID", userID]

static NSString * const kRequestHTTPMethodGet               = @"GET";

static NSString * const kReadPermissionEmail                = @"email";
static NSString * const kReadPermissionPublicProfile        = @"public_profile";
static NSString * const kReadPermissionUserFriends          = @"user_friends";
static NSString * const kReadPermissionUserPhotos           = @"user_photos";

static NSString * const kNameKey                            = @"name";
static NSString * const kFirstNameKey                       = @"first_name";
static NSString * const kLastNameKey                        = @"last_name";
static NSString * const kIDKey                              = @"id";
static NSString * const kPictureKey                         = @"picture";
static NSString * const kDataKey                            = @"data";
static NSString * const kURLKey                             = @"url";
static NSString * const kPhotosKey                          = @"photos";
static NSString * const kCoverPhotoKey                      = @"cover_photo";

static NSString * const kUserInfoContextGraphPath           = @"%@?fields=first_name,last_name,picture.width(%lu).height(%lu)"; // %@ == userID
static NSString * const kUserFriendsContextGraphPath        = @"%@/friends?fields=first_name,last_name,picture.width(%lu).height(%lu),id"; // %@ == userID
static NSString * const kAlbumsContextGraphPath             = @"%@/albums?fields=name,id,picture"; // %@ == userID
static NSString * const kAlbumPhotosContextGraphPath        = @"%@/photos?fields=picture"; // %@ == albumID

static NSString * const kPictureWidthKey                    = @"width";
static NSString * const kPictureHeightKey                   = @"height";

static const NSUInteger kUserInfoContextPictureWidth        = 500;
static const NSUInteger kUserInfoContextPictureHeight       = 500;

static const NSUInteger kUserFriendsContextPictureWidth     = 100;
static const NSUInteger kUserFriendsContextPictureHeight    = 100;

static NSString * const kPhotoAlbumsTitle                   = @"%@'s photos";
static NSString * const kLogoutButtonTitle                  = @"logout";
static NSString * const kAlertActionTitle                   = @"OK";
static NSString * const kAlertMessage                       = @"No internet connection";
static NSString * const kMOMName                            = @"TSYHomework";
static NSString * const kPredicateStringWithID              = @"identifier == %@";
