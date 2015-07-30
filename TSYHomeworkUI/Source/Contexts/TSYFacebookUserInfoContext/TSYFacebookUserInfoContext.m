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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pictureHeight = kUserInfoContextPictureSize;
        self.pictureWidth = kUserInfoContextPictureSize;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    TSYFBUserModel *model = self.model;

    return [NSString stringWithFormat:kUserInfoContextGraphPath, model.ID, self.pictureWidth, self.pictureHeight];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillModelWithResult:(id)result {
    TSYFBUserModel *model = self.model;
    
    model.imageUrl = [NSURL URLWithString:result[kPictureKey][kDataKey][kURLKey]];
    model.name = result[kNameKey];
}

@end
