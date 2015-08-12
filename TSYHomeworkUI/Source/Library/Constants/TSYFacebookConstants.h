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

static NSString * const kNameKey                            = @"name";
static NSString * const kIDKey                              = @"id";
static NSString * const kPictureKey                         = @"picture";
static NSString * const kDataKey                            = @"data";
static NSString * const kURLKey                             = @"url";

static NSString * const kUserFriendsContextGraphPath        = @"%@/friends?fields=name,picture.width(%lu).height(%lu),id";
static NSString * const kUserInfoContextGraphPath           = @"%@?fields=name,picture.width(%lu).height(%lu)";

static NSString * const kPictureWidthKey                    = @"width";
static NSString * const kPictureHeightKey                   = @"height";

static const NSUInteger kUserInfoContextPictureWidth        = 200;
static const NSUInteger kUserInfoContextPictureHeight       = 200;

static const NSUInteger kUserFriendsContextPictureWidth     = 100;
static const NSUInteger kUserFriendsContextPictureHeight    = 100;

static NSString * const kLogoutButtonTitle                  = @"logout";
