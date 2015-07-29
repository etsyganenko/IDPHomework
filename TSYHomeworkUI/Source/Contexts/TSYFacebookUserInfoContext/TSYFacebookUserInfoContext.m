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

static NSString * const kGraphPath      = @"?fields=name,picture.width(200).height(200)";
static NSString * const kNameKey        = @"name";
static NSString * const kPictureKey     = @"picture";
static NSString * const kDataKey        = @"data";
static NSString * const kUrlKey         = @"url";

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
    
    model.imageUrl = [NSURL URLWithString:result[kPictureKey][kDataKey][kUrlKey]];
    model.name = result[kNameKey];
}

@end
