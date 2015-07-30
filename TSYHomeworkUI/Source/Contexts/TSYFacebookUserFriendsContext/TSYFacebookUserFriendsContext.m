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
#import "TSYFacebookConstants.h"

@implementation TSYFacebookUserFriendsContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pictureHeight = kUserFriendsContextPictureSize;
        self.pictureWidth = kUserFriendsContextPictureSize;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    return [NSString stringWithFormat:kFriendsContextGraphPath, model.ID, self.pictureWidth, self.pictureHeight];
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
        friend.imageUrl = [NSURL URLWithString:userFriends[index][kPictureKey][kDataKey][kURLKey]];

        [friends addModel:friend];
    }
}

@end
