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
#import "TSYConstants.h"

static NSString * const kGraphPath      = @"?fields=name,picture.width(200).height(200)";

@implementation TSYFacebookUserInfoContext

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
    
    model.imageUrl = [NSURL URLWithString:result[kFacebookPictureKey][kFacebookDataKey][kFacebookURLKey]];
    model.name = result[kFacebookNameKey];
}

@end
