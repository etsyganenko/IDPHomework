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

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self) {
        self.pictureSize = CGSizeMake(kUserFriendsContextPictureWidth, kUserFriendsContextPictureHeight);
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *userModel = self.model;
    
    CGSize pictureSize = self.pictureSize;
    
    NSUInteger pictureWidth = pictureSize.width;
    NSUInteger pictureHeight = pictureSize.height;
    
    return [NSString stringWithFormat:kUserFriendsContextGraphPath, userModel.userID, pictureWidth, pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *userModel = self.model;
    TSYArrayModel *friendModels = userModel.friends;
    
    NSArray *friendsArray = result[kDataKey];
    
    [friendModels removeAllModels];
    
    for (NSDictionary *friendDictionary in friendsArray) {
        TSYFBUserModel *friendModel = [TSYFBUserModel new];
        
        friendModel.firstName = friendDictionary[kFirstNameKey];
        friendModel.lastName = friendDictionary[kLastNameKey];
        friendModel.userID = friendDictionary[kIDKey];
        friendModel.imageUrl = [NSURL URLWithString:friendDictionary[kPictureKey][kDataKey][kURLKey]];
        
        [friendModels addModel:friendModel];
    }
}

@end
