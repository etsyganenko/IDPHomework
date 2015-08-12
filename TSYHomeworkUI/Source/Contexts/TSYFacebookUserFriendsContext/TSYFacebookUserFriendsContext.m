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
        self.pictureSize = CGSizeMake(kUserFriendsContextPictureWidth, kUserFriendsContextPictureHeight);
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;
    
    CGSize pictureSize = self.pictureSize;
    
    NSUInteger pictureWidth = pictureSize.width;
    NSUInteger pictureHeight = pictureSize.height;
    
    return [NSString stringWithFormat:kUserFriendsContextGraphPath, model.ID, pictureWidth, pictureHeight];
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

- (void)processRequestResult:(id)result error:(NSError *)error {
    TSYFBUserModel *model = self.model;
    if (error) {
        model.state = TSYModelDidFailLoading;
        
        return;
    }
    
    [self fillModelWithResult:result];
    
    model.state = TSYModelDidLoad;
//    model.state = TSYFBUserModelDidLoadUserFriends;
}

@end
