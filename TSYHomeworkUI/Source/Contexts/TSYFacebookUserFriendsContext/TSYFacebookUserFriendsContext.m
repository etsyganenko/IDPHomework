//
//  TSYFacebookUserFriendsContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserFriendsContext.h"
#import "TSYFBUserModel.h"
#import "TSYArrayModel.h"

static NSString * const kGraphPath      = @"me?fields=friends";
static NSString * const kFriendsKey     = @"friends";
static NSString * const kDataKey        = @"data";

@implementation TSYFacebookUserFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return kGraphPath;
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    TSYArrayModel *friends = model.friends;
    NSArray *userFriends = result[kFriendsKey][kDataKey];
    
    [friends addModelsFromArray:userFriends];
}

@end
