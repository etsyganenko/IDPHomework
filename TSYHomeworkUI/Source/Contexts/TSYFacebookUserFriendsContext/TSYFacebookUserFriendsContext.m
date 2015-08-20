//
//  TSYFacebookUserFriendsContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 28.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserFriendsContext.h"

#import "ActiveRecordKit.h"
#import "TSYFBUser.h"
#import "TSYFacebookConstants.h"

#import "NSOrderedSet+TSYCategory.h"

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
    
    return [NSString stringWithFormat:kUserFriendsContextGraphPath, userModel.ID, pictureWidth, pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUser *userModel = self.model;
    
    NSOrderedSet *currentFriends = userModel.friends;
    
    NSArray *loadedFriends = result[kDataKey];
    NSMutableOrderedSet *mutableLoadedFriends = [NSMutableOrderedSet new];
    
    for (NSDictionary *friendDictionary in loadedFriends) {
        TSYFBUser *friend = [TSYFBUser managedObject];
        
        friend.ID = friendDictionary[kIDKey];
        friend.firstName = friendDictionary[kFirstNameKey];
        friend.lastName = friendDictionary[kLastNameKey];
        friend.imageUrl = [NSURL URLWithString:friendDictionary[kPictureKey][kDataKey][kURLKey]];
        
        [friend saveManagedObject];
        
        [mutableLoadedFriends addObject:friend];
    }
    
    userModel.friends = [NSOrderedSet updatedOrderedSet:currentFriends withOrderedSet:mutableLoadedFriends];
}

@end
