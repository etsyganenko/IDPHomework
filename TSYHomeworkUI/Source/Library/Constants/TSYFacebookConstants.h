//
//  TSYFacebookConstants.h
//  TSYHomeworkUI
//
//  Created by Admin on 30.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kRequestHTTPMethodGet           = @"GET";

static NSString * const kReadPermissionEmail            = @"email";
static NSString * const kReadPermissionPublicProfile    = @"public_profile";
static NSString * const kReadPermissionUserFriends      = @"user_friends";

static NSString * const kNameKey                        = @"name";
static NSString * const kIDKey                          = @"id";
static NSString * const kPictureKey                     = @"picture";
static NSString * const kDataKey                        = @"data";
static NSString * const kURLKey                         = @"url";

static NSString * const kFriendsContextGraphPath        = @"%@/friends?fields=name,picture.width(%lu).height(%lu),id";
static NSString * const kUserInfoContextGraphPath       = @"%@?fields=name,picture.width(%lu).height(%lu)";

static NSString * const kPictureWidthKey                = @"width";
static NSString * const kPictureHeightKey               = @"height";

static const NSUInteger kUserInfoContextPictureSize     = 200;
static const NSUInteger kUserFriendsContextPictureSize  = 100;
