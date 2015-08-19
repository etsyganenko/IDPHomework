//
//  TSYFacebookUserFriendsContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserFriendsContext.h"

#import "TSYFBUser.h"
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
    TSYFBUser *userModel = self.model;
    
    CGSize pictureSize = self.pictureSize;
    
    NSUInteger pictureWidth = pictureSize.width;
    NSUInteger pictureHeight = pictureSize.height;
    
    return [NSString stringWithFormat:kUserFriendsContextGraphPath, userModel.id, pictureWidth, pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
//    TSYFBUser *userModel = self.model;
//    NSMutableArray *friendModels = userModel.friends;
//    
//    NSArray *friendsArray = result[kDataKey];
//    
//    [friendModels removeAllObjects];
//    
//    for (NSDictionary *friendDictionary in friendsArray) {
//        TSYFBUser *friendModel = [TSYFBUser new];
//
//        friendModel.firstName = friendDictionary[kFirstNameKey];
//        friendModel.lastName = friendDictionary[kLastNameKey];
//        friendModel.userID = friendDictionary[kIDKey];
//        friendModel.imageUrl = [NSURL URLWithString:friendDictionary[kPictureKey][kDataKey][kURLKey]];
//        
//        [friendModels addObject:friendModel];
//    }
}

@end
