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

static NSString * const kGraphPath      = @"/friends?fields=name,picture,id";
static NSString * const kDataKey        = @"data";
static NSString * const kNameKey        = @"name";
static NSString * const kPictureKey     = @"picture";
static NSString * const kUrlKey         = @"url";
static NSString * const kIDKey          = @"id";

@implementation TSYFacebookUserFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [model.ID stringByAppendingString:kGraphPath];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    TSYArrayModel *friends = model.friends;
    NSArray *userFriends = result[kDataKey];
    
    [friends removeAllModels];
    
    for (NSUInteger index = 0; index < userFriends.count; index++) {
        TSYFBUserModel *friend = [TSYFBUserModel new];

        friend.name = userFriends[index][kNameKey];
        friend.ID = userFriends[index][kIDKey];
        friend.imageUrl = [NSURL URLWithString:userFriends[index][kPictureKey][kDataKey][kUrlKey]];

        [friends addModel:friend];
    }
}

@end
