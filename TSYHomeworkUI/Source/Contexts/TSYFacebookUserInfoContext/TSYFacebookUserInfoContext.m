//
//  TSYFacebookUserInfoContext.m
//  TSYHomeworkUI
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "TSYFacebookUserInfoContext.h"

#import "TSYFBUserModel.h"
#import "TSYImageModel.h"
#import "TSYFacebookConstants.h"

@implementation TSYFacebookUserInfoContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self) {
        self.pictureSize = CGSizeMake(kUserInfoContextPictureWidth, kUserInfoContextPictureHeight);
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

    return [NSString stringWithFormat:kUserInfoContextGraphPath, model.userID, pictureWidth, pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *userModel = self.model;
    
    userModel.imageUrl = [NSURL URLWithString:result[kPictureKey][kDataKey][kURLKey]];
    userModel.firstName = result[kFirstNameKey];
    userModel.lastName = result[kLastNameKey];
}

@end
